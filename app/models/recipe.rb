require 'net/http'
class Recipe < ActiveRecord::Base
    has_and_belongs_to_many :users
    def self.restructure_hash(res_json_hash, all_ids)
        #byebug
        res_json_hash.deep_dup['items'].each_with_index do |elem, idx|
            elem.each do |k, v|
                if (k == 'value')
                    v = JSON.parse(v)
                    res_json_hash['items'][idx]['id'] = v['id']
                    res_json_hash['items'][idx]['title'] = v['title']
                    all_ids.push(v['id'])
                end
            end
        end
        return res_json_hash
    end
    
    def self.concatenate_params(elem, idx, get_recipe_info_params)
        if idx == 0
            return get_recipe_info_params + elem.to_s
        else
            return get_recipe_info_params + '%2C' + elem.to_s
        end
    end

    def self.call_api(uri)
        req = Net::HTTP::Get.new(uri)
        req["X-RapidAPI-Host"] = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        req["X-RapidAPI-Key"] = ENV["SPOONACULAR_API_KEY"]

        res = Net::HTTP.start(uri.hostname, :use_ssl => true) {|http|
            http.request(req)
        }
        return JSON.parse(res.body)
    end
    def self.find_in_api(calories, budget, time)
        base_uri = 'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
        uri = URI(base_uri + '/recipes/mealplans/generate' + '?timeFrame=week&targetCalories=' + calories.to_s)
        res_json_hash = Recipe.call_api(uri)
        all_ids = []
        res_json_hash = Recipe.restructure_hash(res_json_hash, all_ids)
        get_recipe_info_params = ''
        all_ids.each_with_index do |elem, idx|
            get_recipe_info_params = Recipe.concatenate_params(elem, idx, get_recipe_info_params)
            # get recipe nutrition
            get_recipe_nutrition_uri = URI(base_uri + '/recipes/' + elem.to_s + '/nutritionWidget.json')
            res_recipe_nutrition_json_hash = call_api(get_recipe_nutrition_uri)
            res_json_hash['items'][idx]['calories'] = res_recipe_nutrition_json_hash['calories'].to_i
        end
        # get recipe info bulk 
        get_recipe_info_uri = URI(base_uri + '/recipes/' + 'informationBulk?ids=' + get_recipe_info_params)
        res_recipe_info_json = Recipe.call_api(get_recipe_info_uri)
        res_recipe_info_json.each_with_index do |elem, idx|
            res_json_hash['items'][idx]['readyInMinutes'] = elem['readyInMinutes']
            res_json_hash['items'][idx]['image'] = elem['image']
            res_json_hash['items'][idx]['price'] = (elem['pricePerServing'] ? elem['pricePerServing'] : 123456)
        end
        return res_json_hash

    end
end