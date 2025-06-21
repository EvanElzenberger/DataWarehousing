-- Palatir Technologies database developed and written by Evan Elzenberger
-- Created 4/20/21
--Peer Reviewed by: Lillian Tobbs
-----------------------------------------------------------
-- Replace <data_path> with the full path to this file 
-- Ensure it ends with a backslash 
-- E.g., C:\MyDatabases\ See line 17
-----------------------------------------------------------
IF NOT EXISTS(SELECT * FROM sys.databases
	WHERE NAME = N'PalantirTechnologies')
	CREATE DATABASE PalantirTechnologies
GO
USE PalantirTechnologies
--
-- Alter the path so the script can find the CSV files 
--
DECLARE @data_path NVARCHAR(256);
SELECT @data_path = 'C:\Users\Evan.Elzenberger\Desktop\Enterprise Information Managment\Project\PalantirTechnologyBuild\';
--
-- Delete existing tables
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'SubjectArrestRecord'
       )
	DROP TABLE SubjectArrestRecord;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'ArrestType'
		)
	DROP TABLE ArrestType;
--
IF EXISTS (
	SELECT * 
	FROM sys.tables
	WHERE NAME = N'EmployeeHistory'
		)
	DROP TABLE EmployeeHistory
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'Employee'
       )
	DROP TABLE Employee;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'JobType'
       )
	DROP TABLE JobType;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'Agency'
       )
	DROP TABLE Agency;
--

IF EXISTS(
	SELECT * 
	FROM sys.tables
	WHERE NAME = N'SubjectSocialMedia'
       )
	DROP TABLE SubjectSocialMedia;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'MediaType'
       )
	DROP TABLE MediaType;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'SubjectIdentity'
       )
	DROP TABLE SubjectIdentity;
--


-------------------------------------------------------------
-- Create tables
-------------------------------------------------------------

CREATE TABLE SubjectIdentity
	(SubjectID				INT CONSTRAINT pk_subject_id_si PRIMARY KEY,
	--Next line checking if DriverLiscenseNumber is 10 digits long
	DriverLiscenseNumber	NVARCHAR(10) CONSTRAINT ck_driver_liscense_number CHECK ((DriverLiscenseNumber >='1000000000') AND (DriverLiscenseNumber <='9999999999')),
	Gender					NVARCHAR(1)  CONSTRAINT nn_gender NOT NULL,
	DateofBirth				DATE,
	SubjectWeight			NVARCHAR(3) CONSTRAINT nn_subject_weight NOT NULL,
	EyeColor				NVARCHAR (10) CONSTRAINT nn_eye_color NOT NULL,
	StreetAdress			VARCHAR (100),
	City					VARCHAR (50),
	State					NVARCHAR (30) CONSTRAINT nn_state NOT NULL,
	Zipcode					NVARCHAR (5) CONSTRAINT nn_zipcode NOT NULL,
	FirstName				NVARCHAR(50) CONSTRAINT nn_firstname NOT NULL,
	MiddleName				NVARCHAR(50) CONSTRAINT nn_middlename NOT NULL,
	LastName				NVARCHAR(50) CONSTRAINT nn_lastname NOT NULL
	);
CREATE TABLE MediaType
	(MediaTypeID			INT CONSTRAINT pk_media_type_id PRIMARY KEY,
	MediaType				NVARCHAR(15) CONSTRAINT nn_media_type NOT NULL
	);
--
CREATE TABLE SubjectSocialMedia
	(PostID					INT CONSTRAINT pk_post_id PRIMARY KEY,
	SubjectID				INT CONSTRAINT fk_subject_id_ssm FOREIGN KEY REFERENCES SubjectIdentity(SubjectID),
	MediaTypeID				INT CONSTRAINT fk_media_type_id FOREIGN KEY REFERENCES MediaType(MediaTypeID),
	MediaContent			NVARCHAR(200) CONSTRAINT nn_media_content NOT NULL,
	LinkToMediaContent		NVARCHAR(100),
	ContentDate				DATE,
	--Checking if SecurityThreatLevel is between 1 and 5
	SecurityThreatLevel		NVARCHAR(2) CONSTRAINT ck_security_threat_level CHECK ((SecurityThreatLevel	>='1') AND (SecurityThreatLevel<='5'))
	);
CREATE TABLE Agency
	(AgencyID				INT CONSTRAINT pk_agency_id PRIMARY KEY, 
	AgencyName				NVARCHAR(50) CONSTRAINT nn_agency_name NOT NULL,
	AgencyAddress			NVARCHAR(50) CONSTRAINT nn_agency_address NOT NULL,
	City					NVARCHAR(20) CONSTRAINT nn_agency_city NOT NULL,
	State					NVARCHAR(15)  CONSTRAINT nn_agency_state NOT NULL,
	Zipcode					NVARCHAR(10) CONSTRAINT nn_agency_zip_code NOT NULL,
	);
--
CREATE TABLE JobType
	(JobTitleID				INT CONSTRAINT pk_job_title_id PRIMARY KEY,
	JobTitle				NVARCHAR(15) CONSTRAINT nn_job_title NOT NULL,
	ClearanceLevel			INT CONSTRAINT nn_clearance_level NOT NULL
	);
--
CREATE TABLE Employee
	(BadgeID				INT CONSTRAINT pk_badge_id PRIMARY KEY,
	AgencyID				INT CONSTRAINT fk_agency_id FOREIGN KEY REFERENCES Agency(AgencyID),
	JobTitleID				INT CONSTRAINT fk_job_title_id FOREIGN KEY REFERENCES JobType(JobTitleID),
	FirstName				NVARCHAR(15) CONSTRAINT nn_employee_first_name NOT NULL,
	LastName				NVARCHAR(20) CONSTRAINT nn_employee_last_name NOT NULL,
	Address					NVARCHAR(35) CONSTRAINT nn_employee_address NOT NULL,
	City					NVARCHAR(20) CONSTRAINT nn_employee_city NOT NULL,
	State					NVARCHAR(15)  CONSTRAINT nn_employee_state NOT NULL,
	Zipcode					NVARCHAR(10) CONSTRAINT nn_employee_zip_code NOT NULL,
	);
--
CREATE TABLE EmployeeHistory
	(EmployeeHistoryID		INT CONSTRAINT pk_employee_history_id PRIMARY KEY,
	BadgeID					INT CONSTRAINT fk_employee_history_badge_id FOREIGN KEY REFERENCES Employee(BadgeID),
	StartDate				DATE CONSTRAINT nn_employee_history_start_data NOT NULL,
	EndDate					DATE,
	HourlyRate				INT	CONSTRAINT nn_employee_history_hourly_rate NOT NULL
	);
CREATE TABLE ArrestType
	(ArrestTypeID			INT CONSTRAINT pk_arrest_type_id PRIMARY KEY,
	ArrestType				NVARCHAR(20) CONSTRAINT nn_arrest_type NOT NULL
	);
--
CREATE TABLE SubjectArrestRecord
	(ArrestID				INT CONSTRAINT pk_arrest_id PRIMARY KEY,
	SubjectID				INT CONSTRAINT fk_subject_id_sar FOREIGN KEY REFERENCES SubjectIdentity(SubjectID),
	BadgeID					INT CONSTRAINT fk_badge_id FOREIGN KEY REFERENCES Employee(BadgeID),
	ArrestTypeID			INT CONSTRAINT fk_arrest_type_id FOREIGN KEY REFERENCES ArrestType(ArrestTypeID),	
	ArrestDescription		NVARCHAR(500) CONSTRAINT nn_arrest_description NOT NULL,
	ArrestDate				DATE,
	StreetAddressOfArrest	NVARCHAR(200) CONSTRAINT nn_street_address_of_arrest NOT NULL,
	CityOfArrest			NVARCHAR(200) CONSTRAINT nn_city_of_arrest NOT NULL,
	StateOfArrest			NVARCHAR(60) CONSTRAINT nn_state_of_arrest NOT NULL,
	ZipcodeOfArrest			INT CONSTRAINT nn_zipcode_of_arrest NOT NULL
	);
--
--arrest type to become normalize
-- Load table data

EXECUTE (N'BULK INSERT SubjectIdentity FROM ''' + @data_path + N'SubjectIdentity.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	FIRSTROW = 2,
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT MediaType FROM ''' + @data_path + N'MediaType.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	FIRSTROW = 2,
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT SubjectSocialMedia FROM ''' + @data_path + N'SubjectSocialMedia.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	FIRSTROW = 2,
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT Agency FROM ''' + @data_path + N'Agency.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	FIRSTROW = 2,
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT JobType FROM ''' + @data_path + N'JobType.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	FIRSTROW = 2,
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT Employee FROM ''' + @data_path + N'Employee.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	FIRSTROW = 2,
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT EmployeeHistory FROM ''' + @data_path + N'EmployeeHistory.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	FIRSTROW = 2,
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT ArrestType FROM ''' + @data_path + N'ArrestType.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	FIRSTROW = 2,
	KEEPIDENTITY,
	TABLOCK
	);
');
--
EXECUTE (N'BULK INSERT SubjectArrestRecord FROM ''' + @data_path + N'SubjectArrestRecord.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	FIRSTROW = 2,
	KEEPIDENTITY,
	TABLOCK
	);
');
--
-- List table names and row counts for confirmation
--
GO
SET NOCOUNT ON
SELECT 'Agency' AS "Table",			COUNT(*) AS "Rows"	FROM Agency					UNION
SELECT 'ArrestType',				COUNT(*)			FROM ArrestType				UNION
SELECT 'Employee',					COUNT(*)			FROM Employee				UNION
SELECT 'EmployeeHistory',			COUNT(*)			FROM EmployeeHistory		UNION
SELECT 'JobType',					COUNT(*)			FROM JobType				UNION
SELECT 'MediaType',					COUNT(*)			FROM MediaType				UNION
SELECT 'SubjectArrestRecord',		COUNT(*)			FROM SubjectArrestRecord	UNION
SELECT 'SubjectIdentity',			COUNT(*)			FROM SubjectIdentity		UNION
SELECT 'SubjectSocialMedia',		COUNT(*)			FROM SubjectSocialMedia	
ORDER BY 1;
SET NOCOUNT OFF
GO