# Fachschaft:
### A calendar and newsletter solution for the Fachschaft Wirtschaft of the FH Münster

This application is designed to function as a platform for the Fachschaft to publish new events 
and send newsletters containing selected events to subscribers.
It consists of 4 groups of users:
   1. User (basic user)
   2. Fachschaft (member of the Fachschaft)
   3. Manager 
   4. Admin.


### The user roles:

#### User:
* The signed in user has no special abilities in the application.
* He is allowed to view the calendar and to subscribe to the newsletter.
* Furthermore he can change his Password and delete his own user.
* A user that has not signed up is named a visitor. 
* The visitor is not part of the application's model.
* All other roles also have these basic permissions. 

#### Fachschaft
* Basic members of the Fachschaft Wirtschaft belong to this group. 
* They are allowed to create events. 
* Creating an event initializes a special workflow which will be explained later.

#### Manager
* Users that belong to this role have the permission to review events and create newsletters.
* The creation of a newsletter initializes a special workflow. This workflow is also going to be 
    explained later on.
* He is also allowed to approve the deletion of an event. More about this workflow in a later stage.

#### Admin
* The role of the admin permits the members to publish events so they can be shown in the calendar.
* Furthermore the admin is permitted to start the delivery of a newsletter.
* He is the only one who is allowed to administrate the signed in users.
* This means he is able to assign new roles as well as delete users of every group.
* As well as the manager the admin is permitted to approve the deletion of an event.

### The workflows:
1. Event workflow
    * In the following will be described the worklow from the creation of an event to the deletion of an event.  
    The creation of an event can be done by the roles Fachschaft and Admin. To create an event they can either choose 
    the option in the "Kalender" dropdown of the navigation-bar or they use the button displayed underneath the calendar 
    on the home directory.  
    The next step is to fill in the form. Please note that the fields "Titel" and "Beschreibung" are mandatory.  
    The form gives you the opportunity to create recurrent events. If you select this checkbox the wizard will guide you to 
    a page where you can set the details for the recurrence. As an example you can define on which day of the week and for how long the
    event will happen.  
    At the end of the wizard you will be shown a summary of the event you want to create. You can now submit it.  
    The submission will give the members of the role 'Manager' the opportunity to review the created event and to either 
    accept it or decline your request with the option to give a short feedback on why he declined it.  
    Let's assume he accepts and your event is now shown to the admins who now have the chance to publish it, so it will show up in
    calendar.  

    * To delete an event you have to go to the calendar and select the event that you want to delete.
    On the next page you can delete the event or edit it. If you want to delete an event you have to either be an admin or a manager.      If a manager wants to delete an event, the admins get a request and vice versa.  
    
    * You also have the option of editing the event or all events of the related recurrence. If you decide to edit the event you will
    be guided to the form that is also used to create an event. Note that editing an event does not affect the currently published
    event.  
    The edit-request will now trigger the same workflow as the creation of an event does. Only that at the end the old event will be 
    replaced by the new version.
    
    
2. Newsletter workflow  
    * Creation  
    Only a manager is allowed to create a newsletter. To do so he selects the related option in the navigation-bar and fills in the
    related form. He can choose a time range to specify which events will show up in the newsletter. The selection is made by 
    a flag set in the creation wizard of the event.  
    The newsletter no will show up to the admins who can now reject or accept the newsletter. 
    After an acception it will be send out to all the subscribers.
    
-----------------------------------------------------------------------------------------------------
## Setting up the application
######    An example of this application is currently deployed at https://fachschaft.herokuapp.com  

- Main components
    * For this project we used a number of gems listed in the gemfile. The main componentes are the following:
        * Twitter Bootstrap
        * Fullcalendar (http://fullcalendar.io/)
        * Rolify
        * Pundit
        * Devise  
        
        * Please find a more detailed version of the used components at the bottom of this document.
    
    * The database server used in this application is postgresql 9.5
    * The Ruby version is 2\.2\.4
    * The Rails version is 4\.2\.5\.1  
    
##### Local set-up  

* To make sure this application works properly please check the versions of ruby and rails you have installed. 
  They should not be older than the specified versions above.   
* You also have to make sure you have installed a version of the postresql-server on your machine. 
* After you have checked the versions etc. and maybe updated to this versions you can begin by cloning or 
  downloading this repository. 
* When you have the repository on your local machine you need to navigate into the applications root directory. 

        bundle install //to install all required gems (for detailed information look at the bottom of this document)

* The next step is to create and prepare the database. You can do so by running the following commands:  

        rake db:create     // creates the database from the informations given in config/database.yml
        rake db:migrate    // prepares the database structure
        rake db:seed       // populates the database with needed informations for roles as well as sample data
   
* After you set up the database as shown above, you need to specify a smtp server to make use of the notification and
   newsletter functionality. Therefore you have to the development.rb file located at config/environments/development.rb.
* After setting up the smtp-configuration you are ready to start. You just need run 

        rails server // to start the used web-server. The application now available at http://localhost:3000 

* As mentioned before, your database now already stores some pre-defined users that you can use to test the application. 
   They have the following credentials:
   * User:   
        * Username: user@example.com  
        * Password: Sparten123  
   * Fachschaft:  
        * Username: fachschaft@example.com  
        * Password: Sparten123  
   * Manager:  
        * Username: manager@example.com  
        * Password: Sparten123  
   * Admin:  
        * Username: admin@example.com  
        * Password: Sparten123  









