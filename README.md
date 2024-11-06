This project is a web-based application designed to manage user access to various software applications within an organization. The User Access Management System allows users to register, log in, request access to software, and enables managers and admins to approve or reject these requests.

Features
The system includes the following features:

User Registration (Sign-Up): New users can register with a default role of Employee.
User Authentication (Login): Users can log in based on their role (Employee, Manager, Admin).
Software Management: Admins can add new software applications to the system.
Access Request Submission: Employees can request access to different software applications.
Access Request Approval: Managers and Admins can approve or reject access requests.
Technologies Used
Backend: Java Servlets
Frontend: JavaServer Pages (JSP), HTML, CSS, JavaScript
Database: MySQL
Server: Apache Tomcat
IDE: Eclipse



Setup and Installation
Prerequisites
Java Development Kit (JDK): Version 8 or higher
Apache Tomcat: Version 9 or higher
MySQL: Ensure MySQL is installed and running
MySQL JDBC Driver: Add the MySQL JDBC driver to your project if using Eclipse (can be added via Maven dependency if using Maven)
Eclipse IDE: Import the project into Eclipse

Project Configuration in Eclipse
Import Project:

Open Eclipse, go to File > Import > Existing Projects into Workspace.
Select the project folder.
Set Up Tomcat Server:

Go to Window > Preferences > Server > Runtime Environments.
Add Apache Tomcat and set its installation directory.
Database Configuration (DBUtil.java):

Open DBUtil.java in com.example.utils and set up the database connection
If not using Maven, add the MySQL JDBC driver to the project build path manually.

Deployment:

Right-click the project, select Run As > Run on Server, and choose Apache Tomcat.
Eclipse will build the project and deploy it to the Tomcat server.

Running the Application
Access the Application:

Open a web browser and go to http://localhost:8080/UserAccessManagementSystem/login.jsp.
Login and Use the System:

Employee: Register, log in, and submit access requests.
Manager: Log in with manager credentials and approve or reject requests.
Admin: Log in with admin credentials to add software and manage requests.
Folder and File Descriptions
src/com.example.servlets: Contains the Java Servlets for handling user requests (e.g., login, signup, software creation).
src/com.example.utils: Contains the DBUtil.java class for database connections.
WebContent/WEB-INF/web.xml: Configuration file for the web application.
WebContent/signup.jsp, login.jsp: JSP files for the user interface.

Troubleshooting
Database Connection Issues: Ensure the database connection details in DBUtil.java are correct and that MySQL is running.
404 or 500 Errors: Check the Tomcat server logs in Eclipse (Console view) for error details. Confirm all JSP files and Servlets are properly mapped in web.xml.
Role-Based Redirection Issues: Ensure the roles are correctly set in the database (users table) and the login process redirects as expected based on the user role.

