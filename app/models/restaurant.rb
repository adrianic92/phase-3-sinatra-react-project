class Restaurant < ActiveRecord::Base
    has_many :foods

    def my_foods
        #returns an array of all food names that the restaurant serves
        self.foods.map { |t| t.food_name}
    end

end