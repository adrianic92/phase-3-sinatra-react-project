class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get '/restaurants' do
    restaurants = Restaurant.all
    restaurants.to_json(:include => :foods)
    #konata.to_json(:include => :posts)
  end

    #Gets Restaurant by ID
  get '/restaurants/:id' do
    restaurant = Restaurant.find(params[:id])
    restaurant.to_json(:include => :foods)
   end

  #Get the best Restaurant, if any, that has a rating of 10
  get '/bestrestaurants' do
    restaurant = {message: Restaurant.ten_out_of_ten}
    restaurant.to_json(:include => :foods)
  end

  #Gets random restaurant
  get '/restaurants/random' do
    random = Restaurant.random
    random.to_json(:include => :foods)
  end

  #Updates Restaurant
  patch '/restaurants/:id' do
    restaurant = Restaurant.find(params[:id])
    restaurant.update(
      name: params[:name],
      description: params[:description],
      rating: params[:rating],
      location: params[:location]
      )
    restaurant.to_json(:include => :foods)
  end

  #Create a restaurant
  post '/restaurants' do
    restaurant = Restaurant.create(
      name: params[:name],
      description: params[:description],
      rating: params[:rating],
      location: params[:location]
    )
    restaurant.to_json(:include => :foods)
  end

  #Deletes Restaurant
  delete '/restaurants/:id' do
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
    restaurant.to_json(:include => :foods)
  end

  #Gets Foods by Restaurant
  get '/restaurants/:id/foods' do
    foods = Restaurant.find(params[:id]).foods
    foods.to_json
  end

  

  get '/foods' do
    foods = Food.all
    foods.to_json
  end

  #Create a food
  post '/foods' do
    food = Food.create(
      food_name: params[:food_name],
      dessert_pairing: params[:dessert_pairing],
      restaurant_id: params[:restaurant_id]
    )
    food.to_json
  end

  #Updates Food
  patch '/foods/:id' do
    food = Food.find(params[:id])
    food = update(
      food_name: params[:food_name],
      dessert_pairing: params[:dessert_pairing]
    )
    food.to_json
  end

  #Deletes Food
  delete '/foods/:id' do
    food = Food.find(params[:id])
    food.destroy
    food.to_json
  end

  #Gets random food
  get '/foods/random' do
    random = Food.random
    random.to_json
  end
end
