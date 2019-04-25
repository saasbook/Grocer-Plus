require 'net/http'
class Recipe < ActiveRecord::Base

    has_and_belongs_to_many :users

    def self.find_in_api(calories, budget, time)
        base_uri = 'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
        uri = URI(base_uri + '/recipes/mealplans/generate' + '?timeFrame=week&targetCalories=' + calories.to_s)
        req = Net::HTTP::Get.new(uri)
        req["X-RapidAPI-Host"] = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        req["X-RapidAPI-Key"] = ENV["SPOONACULAR_API_KEY"]

        res = Net::HTTP.start(uri.hostname, :use_ssl => true) {|http|
            http.request(req)
        }
        res_json_hash = JSON.parse(res.body)
        res_json_hash_clone = res_json_hash.deep_dup
        all_ids = []
        res_json_hash_clone['items'].each_with_index do |elem, idx|
            elem.each do |k, v|
                if (k == 'value')
                    v = JSON.parse(v)
                    res_json_hash['items'][idx]['id'] = v['id']
                    res_json_hash['items'][idx]['title'] = v['title']
                    all_ids.push(v['id'])
                end
            end
        end
        get_recipe_info_params = ''
        all_ids.each_with_index do |elem, idx|
            if idx == 0
                get_recipe_info_params = get_recipe_info_params + elem.to_s
            else
                get_recipe_info_params = get_recipe_info_params + '%2C' + elem.to_s
            end
            # get recipe nutrition
            get_recipe_nutrition_uri = URI(base_uri + '/recipes/' + elem.to_s + '/nutritionWidget.json')
            req_recipe_nutrition =  Net::HTTP::Get.new(get_recipe_nutrition_uri)
            req_recipe_nutrition["X-RapidAPI-Host"] = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
            req_recipe_nutrition["X-RapidAPI-Key"] = ENV["SPOONACULAR_API_KEY"]
            res_recipe_nutrition = Net::HTTP.start(uri.hostname, :use_ssl => true) {|http|
                http.request(req_recipe_nutrition)
            }
            res_recipe_nutrition_json_hash = JSON.parse(res_recipe_nutrition.body)
            res_json_hash['items'][idx]['calories'] = res_recipe_nutrition_json_hash['calories'].to_i
        end
        # get recipe info bulk 
        get_recipe_info_uri = URI(base_uri + '/recipes/' + 'informationBulk?ids=' + get_recipe_info_params)
        req_recipe_info =  Net::HTTP::Get.new(get_recipe_info_uri)
        req_recipe_info["X-RapidAPI-Host"] = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        req_recipe_info["X-RapidAPI-Key"] = ENV["SPOONACULAR_API_KEY"]
        res_recipe_info = Net::HTTP.start(uri.hostname, :use_ssl => true) {|http|
            http.request(req_recipe_info)
        }
        res_recipe_info_json = JSON.parse(res_recipe_info.body)
        res_recipe_info_json.each_with_index do |elem, idx|
            res_json_hash['items'][idx]['readyInMinutes'] = elem['readyInMinutes']
            res_json_hash['items'][idx]['image'] = elem['image']
            if elem['pricePerServing']
                res_json_hash['items'][idx]['price'] = elem['pricePerServing']
            else
                res_json_hash['items'][idx]['price'] = 123456
            end
        end

        res_json_hash.delete('name')
        res_json_hash.delete('publishAsPublic')
        #puts JSON.pretty_generate(res_json_hash)
        return res_json_hash

    end
end