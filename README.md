#Odin-Facebook
Building a Facebook clone as a final project in the Odin Project's Rails course. The requirements are laid out [on their site](http://www.theodinproject.com/ruby-on-rails/final-project)

###What's done:
* Create the rails app with a postgresql database from the get-go (first time)
* Sign-in with Devise
* Set up Foundation for styling/layout - like it so far
* Set up a welcome mailer for new users.
* Set up Post and Comment models, controllers and views
* Set up Guard and Minitest-Reporters gems to facilitate testing
* Add tests to User model / expand model to include user info (non-auth related)
* Add tests to Post model
* Add integration tests for signed out users and users registrations
* Set up friending with Amistad gem. 
* Add Friendships controller.
* Add users#index page listing all users and their friendship status with current_user.
* Add All Friends page with conditional "Pending invitations"
* Limit newsfeed on posts#index to friends and self.

### To do
* Use Omniauth to allow users to sign in with their real FB account
* Welcome mailer
  * Sendgrid in prod
* Navbar
  * Has notification section
* Friend Requests
  * Friend requests show up in the notification section of nav bar
  * Users can like other users' posts
  * Users can comment on other users' posts
  * Posts always display content, author, likes, comments
* Profile (User show)
  * Use gravatar to start
  * Profile info
  * Photo
  * Posts
* Deploy to Heroku
* Test that user is logged in and can see all pages after signup
* Add user profile type info to Users