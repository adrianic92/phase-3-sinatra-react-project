class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get '/restaurants' do
    restaurants = Restaurant.all
    restaurants.to_json
  end

  get '/restaurants/best' do
    restaurant = {message: Restaurant.ten_out_of_ten}
    restaurant.to_json
  end

  post '/restaurants' do
    restaurant = Restaurant.create(
      name: params[:name],
      description: params[:description],
      rating: params[:rating],
      location: params[:location]
    )
  end

  get '/foods' do
    foods = Food.all
    foods.to_json
  end

  post '/foods' do
    food = Food.create(
      food_name: params[:food_name],
      dessert_pairing: params[:dessert_pairing],
      restaurant_id: params[:restaurant_id]
    )
  end

  patch '/foods/:id' do
    food = Food.find(params[:id])
    food = update(
      food_name: params[:food_name],
      dessert_pairing: params[:dessert_pairing]
    )
  end

  delete '/foods/:id' do
    food = Food.find(params[:id])
    food.destroy
    food.to_json
  end
end
