class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get '/restaurants' do
    restaurants = Restaurant.all
    restaurants.to_json
  end

  #Get the best Restaurant, if any, that has a rating of 10
  get '/restaurants/best' do
    restaurant = {message: Restaurant.ten_out_of_ten}
    restaurant.to_json
  end

  #Gets random restaurant
  get '/restaurants/random' do
    random = Restaurant.random
    random.to_json
  end

  #Create a restaurant
  post '/restaurants' do
    restaurant = Restaurant.create(
      name: params[:name],
      description: params[:description],
      rating: params[:rating],
      location: params[:location]
    )
  end

  #Deletes Restaurant
  delete '/restaurants/:id' do
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
    restaurant.to_json
  end

  #Gets Foods by Restaurant
  get 'restaurant/:id/foods' do
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
  end

  #Updates Food
  patch '/foods/:id' do
    food = Food.find(params[:id])
    food = update(
      food_name: params[:food_name],
      dessert_pairing: params[:dessert_pairing]
    )
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
