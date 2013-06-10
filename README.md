INTRODUCTION
-------------

ArogyaUDHC, which stands for User-Driven HealthCare has been developed using JavaEE.

USER-FLOW
---------

There are 3 types of users :

- care-givers  
	- non-moderator 
	- moderator
- social-workers
- care-seekers


The user-perspective flow for a 'care-seeker' is :

	- Signs up using Google/Yahoo account and is assigned an ( anonymised ) scientific name .
	- Signs in using Google/Yahoo account.
	- Downloads consent letter.
	- Adds her health issue and uploads a scanned image of the (signed) consent letter and awaits its approval.
	- Views uploaded approved & non-approved issues at http://care.udhc.co.in/INPUT/displayMyInputs.jsp
	- Views health issues uploaded by her & by other social workers here 
	  http://care.udhc.co.in/SOLUTION/phrquery.jsp by making a PHR query with the assigned scientific name


The user-perspective flow for a 'social-worker':

	- Signs up using Google/Yahoo account.
	- Adds a new health issue ( specifies patient scientific name )



The user-perspective flow for a 'care-giver' is :
	
	- Signs up using Google/Yahoo account which gives her privileges same as that of a care-seeker.
	- Moderator 'approves' the care-giver and so now she can 
		- take part in discussions and 'comment' on the health issues uploaded on UDHC.


The user-perspective flow for a 'moderator' :

	- Can view the Dashboard http://care.udhc.co.in/DASHBOARD/dashboard.jsp 
	- Approve/Disapprove health issue uploads ( on grounds of violation of HIPAA guidelines).
	- Elevate user privileges to moderator privileges.


FEATURES 
---------

- Login using Google/Yahoo accounts.
- Provision for 3 types of users.
	- Doctors, medical students.
	- Social Workers 
	- Care-seekers or patients.
  The user will need to choose one of the above at the time of registration.
- Care-seekers or patients would able to submit textual narratives with absolute anonymity.	
- Care-seekers or patients would able to upload health reports as a JPEG ( < 1 MB ). The reports will be visible on the website after the moderators assure their de-indentification and anonymity.
- Social workers can post de-identified health narratives and reports ( and an image ).
- The network of doctors will provide a solution to aid the primary healthcare physician. The solution would be available in a printable format.
- Every new health issue( or narrative ) posted will be compared to a repository of previously discussed health cases all over the world. The system will then suggest the case reports similar to the one posted.



INSTALLATION - Application code
--------------------------------

- Clone the repository here. The project will be an eclipse project containing all the dependencies ( JARs ) in the WebContent/WEB-INF/lib directory.
- Import the project into Eclipse Juno. File -> Import.. -> General -> Import project in file system.
- Add and configure the Apache Tomcat 6 Runtime.



INSTALLATION - Database
-------------------------

The database used is a MySQL5.5 database. Currently, the project isn't using any ORM ( Object relational mapper ) like Hibernate. The migration is currently in progress.

There could be 2 approaches to setting up the database 

- Installing the database on a local machine.
- Using a hosted database like Xeround or Amazon RDS ( recommended ).


Make sure you have access to the database from Commandline or any GUI client ( like MySQL Workbench ).
Test your MySQL database connection. 

After the database connection has been tested OK, run the DDL script to setup the tables.

INSTALLATION - Configuration data 
----------------------------------

The application business logic consists of signin OpenID which requires predefined URLs and hence need a little configuration to work properly.

- Open WebContent/WEB-INF/web.xml and locate the following code snippet


	  <context-param>
	    <description>domain</description>
	    <param-name>domain_url</param-name>
	    <param-value> http://care.udhc.co.in/  </param-value>
	  </context-param>

	  Change the <param-value> data to the endpoint where the application has been deployed.
	  When deployed on localhost, remember to enter the context along with the server-name.  

	  Example, 

	  	http://<host>:<port>/<Context>
	  	http://localhost:8080/UDHC
	  	http://care.udhc.co.in/alpha1
	  	http://localhost:8080/MyContext


-  Create a file "credentials.properties" in plaintext and add the following 	 	information.  ( Refer : https://gist.github.com/sbose78/5625572 )

	database_host=ud_DATABASE_HOST_t5xn6.ap-northeast-1.rds.amazonaws.com
	database_port=3306
	database_user=MY_USERNAME
	database_password=My_secret_password
	database_database=DATABASE_NAME
	admin_email=SOME_MAIL@gmail.com
	admin_password=PASSWORD_of_SOME_MAIL

- Create a file "context.xml" in plaintext and add the following information. 	  	Note: this file is used in DB connection pooling.
	( Refer : https://gist.github.com/sbose78/5625572 ) 

		<?xml version="1.0" encoding="UTF-8"?>
		<Context path="/udhc-eclipse-tomcat6" docBase="udhc-eclipse-tomcat6" reloadable="true" crossContext="true">
		    
		    <Resource name="jdbc/awsDB" auth="Container" type="javax.sql.DataSource"
		        testWhileIdle="true"
		       	maxActive="30"
				maxIdle="5"
				maxWait="3000"
				removeAbandoned="true"
				logAbandoned="false"
				removeAbandonedTimeout="3"
			   timeBetweenEvictionRunsMillis="300000"
		       username="ENTER_YOUR_DATABASE_USERNAME" 
		       password="ENTER_YOUR_DATABASE_PASSWORD"
		       driverClassName="com.mysql.jdbc.Driver"  
		       url="jdbc:mysql://udhc-am_YOUR_DATABASE_HOST_zonaws.com:3306/health?autoReconnect=true" />    
		 </Context>




APPLICATION SERVER 
-------------------
This webapp has been developed using Tomcat6, tested and deployed using Tomcat6.

Tested Application server hosts
- Jelastic ( on Servint )
- Amazon Elastic Beanstalk


DATABASE 
----------

Developed, tested and deployed using MySQL 5.5

Tested Database server hosts.

- Xeround 
- Amazon RDS MySQL 5.5

The DDL script to setup the tables :

DEPLOYMENT 
-----------

It is recommended that the application be deployed locally and tested before deployed publicly. 

Run the Eclipse Project locally using the Apache Tomcat 6 Runtime. 
Please make sure the web.xml file has been updated accordingly to include the URL of the locally deployed app.

<context-param>
	    <description>domain</description>
	    <param-name>domain_url</param-name>
	    <param-value> http://localhost:8080/MyContext</param-value>
</context-param>

Checkpoints.

Signup to the application using OpenID Google/Yahoo and check if there are no exceptions or error messages in the console.

Signout and Signin again, if the registration form doesn't get displayed this time - you can be rest assured that the database is configured and the OpenID URL in the web.xml is correct.

Now , to deploy this webapp on a public network as a WAR, make sure
- The URL is updated in web.xml

	<context-param>
	    <description>domain</description>
	    <param-name>domain_url</param-name>
	    <param-value> http://care.udhc.co.in</param-value>
	</context-param>
- The corresponding database connection information in the credentialsproperties" file is reachable from the server where the WAR is being deployed.

After the above steps are verified, generate the WAR 

( Right click on the project , Export -> as WAR )

Salient coding techniques and libraries used .

- imgsclr is used for Scaling down images in the response.
- Rich Text areas are generated using the cleditor JQuery plugin.
- XMLHTTPRequests are wrapped using the Yahoo User-Interface library ( YUI 2 ) and mostly JQuery.