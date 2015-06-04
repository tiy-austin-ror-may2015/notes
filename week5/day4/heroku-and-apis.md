# Working with Heroku (and building APIs)
[Heroku](https://heroku.com) is a website that we are using to host our rails apps.


## Working with Heroku
### Creating a new Heroku app
	[my_project][master]$ heroku create

### Deploying code to heroku
	[my_project][master]$ git push heroku master
Heroku is another remote of your local git repo. That means you **need** to add, commit, *and* push all your changes to heroku for them to reflect on your live site.

### Checking your logs
	[my_project][master]$ heroku logs
if you run into an error and heroku says to check the logs. This is how you check then.
	
### Migrating the database
	[my_project][master]$ heroku run rake db:migrate
Everytime you run `rake db:migrate` locally or otherwise change your database locally, you will need to do the same on heroku.


## Building (an insecure) API
### Dealing with Requests
### Turning off CSRF
To turn off CSRF protection in our rails projects we need to change one line and add one line to our `ApplicationController`

```
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  
end
```
Make sure the above two lines are found within your `ApplicationController`

### Turning off CORS
To turn off CORS protection we have to make sure all of our responses have the right headers set. Doing this manually for each route would be tedious and error prone. Luckily, Rails allows us to set our headers globally by adding a few lines to our `Application` class found in `config/application.rb`

```
module MyAppName
  class Application < Rails::Application
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin'   => '*',
      'Access-Control-Allow-Methods'  => 'POST, PUT, DELETE, GET, OPTIONS',
      'Access-Control-Request-Method' => '*',
      'Access-Control-Allow-Headers'  => 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    }
    config.active_record.raise_in_transactional_callbacks = true
end
```
I removed all the comments to save space, but it goes right there inside of that class.

### Setting up a 'catch all' route