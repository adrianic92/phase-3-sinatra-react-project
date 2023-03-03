class Food < ActiveRecord::Base
    belongs_to :restaurant
    
    #Random Food Generator
    def self.random
        self.all.sample
    end
end