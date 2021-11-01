$ rails new chicken_tinder_backend -d postgresql -T
 $ cd chicken_tinder_backend/
$ rails db:create
$ bundle add rspec-rails
 $ rails g rspec:install
 $ git remote add origin https://github.com/learn-academy-2021-delta/cat-tinder-backend-jollidevs.git
 $ git checkout -b main
 $ git status
$  git add .
 $ git commit -m "created main branch for rails"
 $ git push origin main
 $  pwd
 $ git branch
$  git checkout -b backend-structure
 $  code .

Add a resource
$ rails generate resource Chicken name:string age:integer enjoys:text
$ rails db:migrate
$ rspec spec

Review that db/migrate and confid/routes.rb have upated

Go to db/seeds.rb
    Give the array for the chicken variable and a function to populate the list with the attributes from the array

$rails db:seed
    Expect to see the below syntax for each object
    "creating chickens {:name=>\"Biscuits\", :age=>5, :enjoys=>\"rooftops and trees\"}"

Skip Authenticity Token
We need to update the application controller to allow requests from applications outside the Rails application.
app/controllers/application_controller.rb
    skip_before_action :verify_authenticity_token

Enable CORS
CORS which stands for Cross-Origin Resource Sharing. Our React frontend and Rails backend applications are running on two different servers. We have to tell the Rails app that (while in development) it is okay to accept requests from any outside domain.

    Adding this line of code to the Gemfile:
    gem 'rack-cors', :require => 'rack/cors'

    Add a file to the config/initializers directory named cors.rb and add the boiler plate code to the new file:
    config/initializers/cors.rb

CORS in Production
When you take your app to production, you'll want to change the wildcard * to the URL that your frontend app is served from.

$ bundle
