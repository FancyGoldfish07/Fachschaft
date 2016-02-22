# Fachschaft

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
22.02.2016
Calendar views now available at /home but without authentification. This still has to be implemented.
