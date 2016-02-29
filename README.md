# Fachschaft:
## A calendar and newsletter solution for the Fachschaft Wirtschaft of the FH Münster

This application is designed to function as a platform for the Fachschaft to publish new events 
and send newsletters containing selected events to subscribers.
It consists of 4 groups of users:
* 1. User (basic user)
* 2. Fachschaft (member of the Fachschaft)
* 3. Manager 
* 4. Admin.
### The user roles:

#### User:
*   The signed in user has no special abilities in the application.
He is allowed to view the calendar and to subscribe to the newsletter.
Furthermore he can change his Password and delete his own user.
A user that has not signed up is named a visitor. 
The visitor is not part of the application's model.
All other roles also have these basic permissions. 

#### Fachschaft
* Basic members of the Fachschaft Wirtschaft belong to this group. 
* They are allowed to create events. 
* Creating an event initializes a special workflow which will be explained later.

#### Manager
* Users that belong to this role have the permission to review events and create newsletters.
* The creation of a newsletter initializes a special workflow. This workflow is also going to be 
* explained later on.
* He is also allowed to approve the deletion of an event. More about this workflow in a later stage.

#### Admin
* The role of the admin permits the members to publish events so they can be shown in the calendar.
* Furthermore the admin is permitted to start the delivery of a newsletter.
* He is the only one who is allowed to administrate the signed in users.
* This means he is able to assign new roles as well as delete users of every group.
* As well as the manager the admin is permitted to approve the deletion of an event.

### The workflows:
* 1. Event creation
*  The 






12.02.2016: <br>
            Login forms now available on /users/sign_up, users/sign_in/ with new design.<br>
            1st user is always admin as stated in app/models/user.rb.<br>
            If you don't remember the first user run rake db:drop and rake db:create.<br><br>
19.02.2016 <br>
*Switched to rolify from enums, so everyone can be happy now
*Major revamp of the Event model
*Bunch of new models
*EventCategory which defines a type of event. An event can have one eventcategory.
*An event can also have multiple roles, to control visibility - user access control itself is not yet done!
*Role has a lot of static functions now, so that we could in theory leave Rolify behind if this is desired. Rolify has
proven to be difficult so far...

#Be sure to run rake db:seed after you did your migrations.
<br><br>
22.02.2016 <br>
Calendar views now available at /home but without authentification. This still has to be implemented.
