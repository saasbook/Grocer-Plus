require 'net/http'
class Recipe < ActiveRecord::Base
    def self.find_in_api(calories, budget, time)
        base_uri = 'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/mealplans/generate'
        uri = URI(base_uri + '?timeFrame=week&targetCalories=' + calories.to_s)
        req = Net::HTTP::Get.new(uri)
        req["X-RapidAPI-Host"] = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        req["X-RapidAPI-Key"] = ENV["SPOONACULAR_API_KEY"]

        res = Net::HTTP.start(uri.hostname, :use_ssl => true) {|http|
            http.request(req)
        }
        #puts JSON.pretty_generate(JSON.parse(res.body))
        return res
    end
end
