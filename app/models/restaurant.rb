class Restaurant < ActiveRecord::Base
    has_many :foods

    def my_foods
        #returns an array of all food names that the restaurant serves
        self.foods.map { |t| t.food_name}
    end
    
    def self.ten_out_of_ten
        #returns the name of the first record with a 10 rating. If no record has a 10 rating, returns message.
        michellin = self.find_by(rating: 10).name
        michellin ? michellin : "There are no perfect restaurants out there..."
    end

end