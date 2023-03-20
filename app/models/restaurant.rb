class Restaurant < ActiveRecord::Base
    has_many :foods, dependent: :destroy
    
    #Returns the name of the first record with a 10 rating. 
    #If no record has a 10 rating, returns message.
    def self.ten_out_of_ten
        michellin = self.where(rating: 10)
        michellin ? michellin : "There are no perfect restaurants out there..."
    end

    #Random Restaurant Generator
    def self.random
        self.all.sample
    end

end