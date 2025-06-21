-- Updating Views File
--Please refresh the view objects by running the first, second, third then fourth batch of code.
--Each batch is indicated by the long "-----" sections.
--Please execute each section INDIVIDUALY.
--Script will not run out of order. Or all at once.
------------------------------------------------
--Run First
USE PalantirTechnologies
GO
IF EXISTS(
	SELECT *
	FROM sys.views
	WHERE NAME = N'VSubjectFullName'
	)
	DROP VIEW VSubjectFullName;

IF EXISTS(
	SELECT *
	FROM sys.views
	WHERE NAME = N'ArrestTypeLabel'
	)
	DROP VIEW ArrestTypeLabel

	IF EXISTS(
	SELECT *
	FROM sys.views
	WHERE NAME = N'SearchResults'
	)
	DROP VIEW SearchResults
------------------------------------------------
--Run Second
USE PalantirTechnologies
GO
CREATE VIEW dbo.VSubjectFullName
AS
SELECT        SubjectID, FirstName + ' ' + LastName AS SubjectFullName
FROM            SubjectIdentity;
------------------------------------------------
--Run Third
USE PalantirTechnologies
GO
CREATE VIEW dbo.ArrestTypeLabel
AS
SELECT        ArrestType, ArrestTypeID
FROM            ArrestType
------------------------------------------------
--Run Fourth
USE PalantirTechnologies
GO
CREATE VIEW dbo.SearchResults
	AS 
	SELECT        Agency.AgencyName, Employee.BadgeID, JobType.JobTitle, JobType.ClearanceLevel, Employee.FirstName, Employee.LastName, Employee.Address, Employee.Zipcode, EmployeeHistory.StartDate, 
                         EmployeeHistory.HourlyRate
FROM            Agency INNER JOIN
                         Employee ON Agency.AgencyID = Employee.AgencyID INNER JOIN
                         EmployeeHistory ON Employee.BadgeID = EmployeeHistory.BadgeID INNER JOIN
                         JobType ON Employee.JobTitleID = JobType.JobTitleID