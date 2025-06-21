[README.txt](https://github.com/user-attachments/files/20848265/README.txt)# Data Warehousing & Vizualization

## Course Description:
Main components of a data warehouse (DW) for business intelligence applications. The course covers topics such as data modeling, combining data from different sources, and developing management reports. Students will learn how to plan, design, and build a DW, as well as analyze data and create reports and dashboards within the DW environment.

## Skills Learned:
- Plan, Design, and Model the Data Warehouse (DW)
  - Utilized various software tools such as Visual Studio, Visio, Word, and Excel to create effective data models for business intelligence purposes.

- Build the Data Warehouse (DW)
  - Utilized Visual Studio (VS) and SQL Server Management Studio (SSMS) to implement the necessary structures and components of a data warehouse.

- Develop a Running Application for Data Import, Database Search, and Table Manipulation:
  - Successfully created a running application that enables the import of new data into the data warehouse. The application also includes functionality for performing database searches with filters and the ability to sort tables generated within the data warehouse. Implemented this functionality using appropriate programming languages and frameworks, ensuring a user-friendly interface and efficient data manipulation capabilities.

- Extract, Transform, and Load (ETL) the Data Warehouse (DW)
  - Acquired the skills to extract data from an Online Transaction Processing (OLTP) environment and transform it into an appropriate format for loading into the data warehouse. Effectively used Visual Studio (VS) and SQL Server Integration Services (SSIS) to carry out the ETL process.

- Develop Tabular and Multidimensional Analysis from the Data Warehouse (DW)
  - Learned how to perform tabular and multidimensional analysis on the data stored in the data warehouse. Utilized tools such as Visual Studio (VS), Excel, and SQL Server Analysis Services (SSAS) to analyze and explore data from different perspectives.

- Create Reports and Dashboards from the Data Warehouse (DW)
  - Developed the necessary skills to construct meaningful reports and interactive dashboards within the data warehouse environment. Utilized Visual Studio (VS) and Microsoft Power BI to create visually appealing and insightful reports and dashboards.


## Software:
- VS: [Visual Studio](https://visualstudio.microsoft.com/)
  - Comprehensive development environment for data modeling, building the data warehouse, analysis, and reporting.
- SSMS: [SQL Server Management Studio](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16)
  - Database management and administration tool for the SQL Server used in the data warehouse.
- SSIS: [SQL Server Integration Services](https://learn.microsoft.com/en-us/sql/integration-services/sql-server-integration-services?view=sql-server-ver16)
  - ETL platform for extracting, transforming, and loading data into the data warehouse.
- Excel: [Microsoft Excel](https://www.microsoft.com/en-us/microsoft-365/excel)
  - Data analysis tool supporting tabular and multidimensional analysis of data in the data warehouse.
- SSAS: [SQL Server Analysis Services](https://learn.microsoft.com/en-us/analysis-services/ssas-overview?view=asallproducts-allversions)
  - Enables multidimensional analysis and exploration of data in the data warehouse.
- Power BI: [Microsoft Power BI](https://powerbi.microsoft.com/en-us/)
  - Creation of reports and interactive dashboards with powerful visualization and data exploration capabilities.
## Readme file for creating database and application on home system
[UploadiINFO 3240 Phase 3 Spring 2021
DB Developer: Evan Elzenberger
DB Name: Palantir Technologies
Peer Reviewer Name Lillian Tobias
Peer Review Date 6/7/21
--------------------------------------------------------------------------------
Recent Update Log

Phase 3 Feedback:
Rebuild Phase 1:
2 Various Check Constraint Added
2 Views added, may have been causing download bug

Comment Section:
Directory structure is clean, files organized and named accordingly.
Project has a combination of useful and well-designed forms 
(one each for detail, grid, and subform).
Practical, functional and creative Search form.
Aggregations (sum, count, average) used in at least one form.
(Some) heavy lifting was noticed.
--------------------------------------------------------------------------------

Welcome to the Palantir Technologies README.txt file.

Here you will learn about how the database works and what to run first.
It is important you run everything in the proper order for this data system to work on your machine.
Please follow the instructions for the first section titled "Organize files, build database and views"
Then, follow the next section titled "Running the Startup form"
Followed by section three, “Using the Application”
Then section four, “Utilizing Reports”
--------------------------------------------------------------------------------
Section 1: Organize files, build database and views

FIRST, open the PalantirTechnologiesBuild folder
Double click on the BuildPalantir file
Change line 17 instructions are within the sql file
Click Execute

THEN, back in PalantirTechnologiesBuild folder
Double click on the BuildViews sql file
Run them in the order specified within the sql file

Now, from the Phase 3 folder
Move the PalantirTechnologies folder into your repos folder for Visual Studio

Finally, open Visual Studio
Navigate and click on the box titled "Open a project or solution"
Navigate to the PalantirTechnologiesForms Folder and then PalantirTechnologiesForms File and double click it.

You should see two folders in the Solution Explorer of Visual Studio
PalantirTechnologiesForms
PalantirTechnologiesReports
--------------------------------------------------------------------------------
Section 2: Running Forms and Reports

To run the forms begin in Solution Explorer looking inside the PalantirTechnologiesForms
Double click on my "My Project" with the wrench icon

On the Application
Please select "Startup" as the form in the box labeled "Startup form:"
--------------------------------------------------------------------------------
Section 3: Using the Application 

For Federal Agents two forms are available
Officer Enforcement Record: Here the user can see a detailed subform of all arrests an officer has made. This would be useful for each agency to better understand how they are interacting with the community on per officer basis. 
Social Media Record: Here you find a tabular view of all social media records and the name of the subject who created them. This would be helpful in managing risk for the department and officers involved with interacting with subjects that openly flaunt criminal activity. This table is ready to be fed some sort of data scraping tool to fill more rows of public posting inciting danger or criminal activity.

For Agency use two forms is available
Employee: After clicking on the Employee button press the yellow cross in the top left corner, to get a blank form in order to add a new employees information. The Employee form is designed to allow all agencies to add employees remotely to our database. This form is setup in a detail's data type. Additionally, this form has a help button in order to clarify information being entered. 
Record Lookup: Is the last available form, here you can select options from the drop down menus and then click search and see all the officers within an agency and with a specific job title.

--------------------------------------------------------------------------------
Section 4: Utilizing Reports

Within the PalantirTechnologiesReports folder in Solution Explorer, and then within Reports
There will be many options for the first report please select MediaSeachv5
Arrest Report: This report shows the criminal record of each subject that has been arrested. This report is organized by Full Name
Agency Employee Report: This report shows employees by each agency
ng README.txt…]()

## Image of database 
![Diagram](https://github.com/user-attachments/assets/0deba323-d90d-483f-adb7-e68b041b4ff7)
