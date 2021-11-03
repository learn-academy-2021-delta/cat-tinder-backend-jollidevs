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

$rails routes


app/controllers/chickens_controller.rb
Update ChickensController to show methods

it 'does not update a chicken without an age' do
      chicken_params ={
        chicken: {
            name: 'Thighs',
            bank: "Wells Fargo',
            enjoys: 'Likes to hike'
        }
      }
      post '/chickens', params: chicken_params
      expect(response.status).to eq 422
      chicken = JSON.parse(response.body)
      expect(chicken['age']).to include "can't be blank"
      end

/spec/requests/chickens_request_spec.rb
add update it statement
all tests will live between do and end
using the test db to accomplish this actions
creating an active record query to fill the empty db
then pass the http verb to call upon a method in the ChickensController

$rspec spec
describe "GET /index" do
run test on empty method then update method to pass test

calling a param to send up the river
check to see if the post got sent to database---200 response means success
assign a variable to an active record query
describe "POST /create" do
# The params we are going to send with the request
 # Send the request to the server
 # Assure that we get a success back
 # Look up the chicken we expect to be created in the db
   # Assure that the created chicken has the correct attributes
   #add strong params with the create method

describe "PATCH /update" do   
describe "DELETE /destroy" do
    remember to reset variable
   update and destory will need a parameter to be passed

you know you are in request if you see plural

Potential update validation answer
it 'does not update a chicken without an enjoys' do
        chicken_params ={
          chicken: {
            name: 'Thighs',
            age: 8,
            enjoys: 'Likes to hike'
          }
        }
        post '/chickens', params: chicken_params
        chicken = Chicken.first
      
        updated_chicken_params = {
        chicken: {
          name: 'Thighs',
          age: 8
        }
      }
        patch "/chickens/#{chicken.id}", params: updated_chicken_params
        chicken = Chicken.first
        expect(response.status).to eq 422
        chicken = JSON.parse(response.body)
        expect(chicken['enjoys']).to include "can't be blank"
      end

def update
        chicken = Chicken.find(params[:id])
        chicken.update(chicken_params)
        if chicken.valid?
            render json: chicken
        else
            render json: chicken.errors, status: 422
        end
    end

Rspec testing to test without everything: rspec spec/requests/chickens_spec.rb