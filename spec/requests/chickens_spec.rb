require 'rails_helper'

RSpec.describe "Chickens", type: :request do
  describe "GET /index" do
    it "gets a list of chickens" do
      Chicken.create name: 'Thighs', age: 2, enjoys: 'Likes to hike'

      # Make a request
      get '/chickens'

      chicken = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(chicken.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a chicken" do
      chicken_params = {
        chicken: {
          name: 'Thighs',
          age: 2,
          enjoys: 'Likes to hike'
        }
      }
      post '/chickens', params: chicken_params
      expect(response).to have_http_status(200)
      chicken = Chicken.first
      expect(chicken.name).to eq 'Thighs'
    end
  end

  describe "PATCH /update" do
    it "updates a chicken" do
      chicken_params = {
        chicken: {
          name: 'Thighs',
          age: 2,
          enjoys: 'Likes to hike'
        }
      }
      post '/chickens', params: chicken_params
      chicken = Chicken.first
      
      updated_chicken_params = {
        chicken: {
          name: 'Thighs',
          age: 8,
          enjoys: 'Likes to hike'
        }
      }
      patch "/chickens/#{chicken.id}", params: updated_chicken_params
      chicken = Chicken.first
      expect(response).to have_http_status(200)
      expect(chicken.age).to eq 8
    end
  end
  
  describe "DELETE /destroy" do
    it 'deletes a chicken' do
      # create the cat
      chicken_params = {
        chicken: {
          name: 'Thighs',
          age: 8,
          enjoys: 'Likes to hike'
        }
      }
      post '/chickens', params: chicken_params
      chicken = Chicken.first
      delete "/chickens/#{chicken.id}"
      expect(response).to have_http_status(200)
      chickens = Chicken.all
      expect(chickens).to be_empty
    end
  end

  describe 'chicken validation error codes' do

    it 'does not create a chicken without a name' do
    chicken_params ={
      chicken: {
          age: 8,
          enjoys: 'Likes to hike'
      }
    }
    post '/chickens', params: chicken_params
    expect(response.status).to eq 422
    chicken = JSON.parse(response.body)
    expect(chicken['name']).to include "can't be blank"
    end
    
    it 'does not create a chicken without an age' do
      chicken_params ={
        chicken: {
            name: 'Thighs',
            enjoys: 'Likes to hike'
        }
      }
      post '/chickens', params: chicken_params
      expect(response.status).to eq 422
      chicken = JSON.parse(response.body)
      expect(chicken['age']).to include "can't be blank"
      end

      it 'does not create a chicken without an enjoys' do
        chicken_params ={
          chicken: {
            name: 'Thighs',
              age: 8
          }
        }
        post '/chickens', params: chicken_params
        expect(response.status).to eq 422
        chicken = JSON.parse(response.body)
        expect(chicken['enjoys']).to include "can't be blank"
      end

    end
  
end
