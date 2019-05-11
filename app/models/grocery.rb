class Grocery < ActiveRecord::Base
    belongs_to :recipe
    def to_s
        "name: " + self.name + ", weight(g): " + self.weight_in_grams.to_s
    end
end
