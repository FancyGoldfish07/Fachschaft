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


# Gems used in this production
### Grouped by environment:

* Production:  
    
            ruby '2.2.4'
            # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
            gem 'rails', '4.2.5.1'
            # Use postgresql as the database for Active Record
            gem 'pg', '~> 0.18.4'
            # User Log-in-Forms
            gem 'devise', '~> 3.5', '>= 3.5.6'
            # Authentification
            gem 'pundit', '~> 1.1'
            #Rolify, definition and handling of user roles
            gem 'rolify', '~> 5.0'
            # jQuery-calendar gem
            gem 'fullcalendar-rails', '~> 2.6'
            #MomentJS for the Calendar
            gem 'momentjs-rails', '>= 2.8.1', :github => 'derekprior/momentjs-rails'
            # Mailer
            gem 'mailgun-ruby', '~>1.0.3', require: 'mailgun'
            gem 'puma', '~> 2.16'
            
            # Background Tasks
            gem 'delayed_job_active_record', '~> 4.1'
            
            #Datetime validation
            gem 'validates_timeliness', '~> 4.0'

            # Turbolinks makes following links in your web application faster. 
            # Read more: https://github.com/rails/turbolinks
            gem 'turbolinks', '~> 2.5', '>= 2.5.3'
            
            # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
            gem 'jbuilder', '~> 2.0'
            
            # Easy creation of bootstrap formatted forms
            gem 'bootstrap_form', '~> 2.3'
            
            # Use jquery as the JavaScript library
            gem 'jquery-rails', '~> 4.1
            
            # Use SCSS for stylesheets
            gem 'sass-rails', '~> 5.0'
            
            # Use Uglifier as compressor for JavaScript assets
            gem 'uglifier', '>= 1.3.0'
            
            #Fonts
            gem 'font-awesome-rails', '~> 4.5', '>= 4.5.0.1'
            gem 'weather-icons-rails', '~> 0.1.1'
            
            #Bootstrap
            gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
        
            #Nested forms helper
            gem 'cocoon', '~> 1.2', '>= 1.2.7'
            
            #DESIGN
            #AngularJS
            gem 'angularjs-rails', '~> 1.5'
            
            # #Wicked for creating wizards
            gem 'wicked', '~> 1.2', '>= 1.2.1'
            
            # bundle exec rake doc:rails generates the API under doc/api.
            gem 'sdoc', '~> 0.4.0', group: :doc
            
            #Ice-Cube, Recurrence Library, Easy creation of recurrence rules
            gem 'ice_cube', '~> 0.13.3'
            
            #Deep clone
            gem 'deep_cloneable', '~> 2.2.0'
            
            # Use ActiveModel has_secure_password
            gem 'bcrypt', '~> 3.1.7'
            
            # somehow Heroku did not want to deploy without them 
            gem 'rails_12factor', '~> 0.0.3'
            gem 'simple_form', '~> 3.2', '>= 3.2.1'

* development, test

            # Call 'byebug' anywhere in the code to stop execution and get a debugger console
            gem 'byebug', '~> 8.2', '>= 8.2.2'
            # Testing with simulating user actions
            gem 'capybara', '~> 2.6', '>= 2.6.2'
            # Factory girls for creating objects
            gem 'factory_girl_rails', '~> 4.6'
            # rspec tests
            gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
            gem 'guard-rspec', '~> 4.6', '>= 4.6.4'
            # easily generate fake data such as names, adresses, ...
            gem 'faker', '~> 1.6', '>= 1.6.3'

* development:  

            # Access an IRB console on exception pages or by using <%= console %> in views
            gem 'web-console', '~> 2.0'
            # Spring speeds up development by keeping your application running in the background. 
            # Read more: https://github.com/rails/spring
            gem 'spring', '~> 1.6'



