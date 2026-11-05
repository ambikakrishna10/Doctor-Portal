**DOCTOR PORTAL MANAGEMENT SYSTEM**

**Project Overview**
  -	The Doctor Portal Management System is a Java-based web application developed using Spring MVC, JSP, JDBC, and MySQL. It allows users to manage doctor information through a simple and user-friendly interface.
  -	The application supports registering new doctors, viewing registered doctor details, searching for doctors using their ID, updating existing records, and deleting doctor records.

**Technologies Used**
  -	Programming Language: Java
  -	Framework: Spring MVC
  -	Frontend: JSP, HTML, CSS, JavaScript
  -	Database: MySQL
  -	Database Connectivity: Spring JDBC (JdbcTemplate)
  -	Server: Apache Tomcat 11
  -	IDE: Eclipse IDE
  -	Build Tool: Maven

**Features**
  -	Home Page
    o	Welcome page with navigation options.
    o	Register Doctor and View Doctors buttons.
  -	Doctor Registration
    o	Register doctors with personal and professional details.
    o	Capture doctor name, age, mobile number, gender, consultation fee, hospital name, department, availability, and shift.
  -	View Doctors
    o	Display all registered doctors in a table.
    o	Search for a doctor using Doctor ID.
  -	Update Doctor
    o	Retrieve existing doctor details.
    o	Modify and save updated information.
  -	Delete Doctor
    o	Delete doctor records from the database.
    o	Confirmation popup before deletion.

**Project Workflow**
  -	The application follows the Spring MVC architecture:
  -	The user accesses the Home Page.
  -	The user selects Register Doctor or View Doctors.
  -	Spring MVC Controller receives the request.
  -	The Controller communicates with the DoctorDAO.
  -	DoctorDAO performs database operations using JdbcTemplate.
  -	MySQL stores and retrieves doctor information.
  -	The result is displayed through JSP pages.
