#Odin-Facebook
Building a Facebook clone as a final project in the Odin Project's Rails course. The requirements are laid out [on their site](http://www.theodinproject.com/ruby-on-rails/final-project)

###What's done:
* Create the rails app with a postgresql database from the get-go (first time)
* Sign-in with Devise
* Set up Foundation for styling/layout - like it so far.
* Add tests to User model / expand model to include user info (non-auth related)

### To do
* Use Omniauth to allow users to isng in with their real FB account
* Welcome mailer
  * Letter_opener in development
  * Sendgrid in prod
* Navbar
  * Has notification section
* Friend Requests
  * Users can request friendship with other users
  * Users must approve friend requests
  * Friend requests show up in the notification section of nav bar
* Users can create posts
  * Users can like other users' posts
  * Users can comment on other users' posts
  * Posts always display content, author, likes, comments
* Timeline (Posts index)
  * All posts from user and user's friends
* Profile (User show)
  * Use gravatar to start
  * Profile info
  * Photo
  * Posts
* Users Index
  * All users
  * Buttons for sending friend requests to anyone:
    * Not already a friend
    * Not having a pending friend request
* Deploy to Heroku
* Test that user is logged in and can see all pages after signup