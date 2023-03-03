class Food < ActiveRecord::Base
    belongs_to :restaurant
    
    def self.random
        self.all.sample
    end
end