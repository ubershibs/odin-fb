#Odin-Facebook
Building a Facebook clone as a final project in the Odin Project's Rails course. The requirements are laid out [on their site](http://www.theodinproject.com/ruby-on-rails/final-project)

###What's done:
* Create the rails app with a postgresql database from the get-go (first time).
* Sign-in with Devise.
* Set up Foundation for styling/layout - like it so far.
* Set up a welcome mailer for new users, using Sendgrid.
* Set up Post and Comment models, controllers and views.
  * Add photos to the post model. Used an optional photo on a regular post via paperclip, rather than mulitple post types with polymorphic associations per the instructions. I did, however, use polymorphic associations for my Like and Notification modules.
* Set up Guard and Minitest-Reporters gems to facilitate testing.
* Add tests to User, Post, Comment, and Like models, as well as limited integration and controller tests.
* Extend User model to include profile info (name, town, gender)
* Add user photos using paperclip gem as well as default gravatar
* Add integration tests for signed out users and users registrations
* Set up friending with Amistad gem / add friendship controller.
* Add users#index page listing all users and their friendship status with current_user.
* Add All Friends page with conditional "Pending invitations"
* Limit newsfeed on posts#index to friends and self.
* Activity based on friendship:
  * Users can comment on and like own and friends' posts anywhere posts appear.
  * Users can always see the number of comments and likes on a post.
  * Users receive notifications when another user comments on or likes something they've commented on or liked.
  * Users receive notifications when other users request or confirm their friendship.

### To do
* Use Omniauth to allow users to sign in with their real FB account
