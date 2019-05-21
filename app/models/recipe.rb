require 'net/http'
class Recipe < ActiveRecord::Base
    has_many :groceries
    belongs_to :user

    def self.call_api(uri)
        req = Net::HTTP::Get.new(uri)
        res = Net::HTTP.start(uri.hostname, :use_ssl => true) {|http|
            http.request(req)
        }
        if res.code == '401'
            return nil
        else
            return JSON.parse(res.body)
        end
    end
    def self.find_in_api(calories, time, dietary_preferences)
        base_uri = 'https://api.edamam.com/search'
        meal_types = ['breakfast', 'lunch', 'dinner']
        res = {'items' => []}
        meal_types.each_with_index do |elem, idx|
            uri = URI(base_uri + '?q=' + elem + '&app_id=' + ENV["APP_ID"] + '&app_key=' +  ENV["APP_KEY"] + '&from=0&to=1&calories=' + ((calories / 3) - 100).to_s + '-' + ((calories / 3) + 100).to_s + '&time=' + 1.to_s + '-' + (time / 3).to_s + dietary_preferences)
            res_json_hash = Recipe.call_api(uri)
            if res_json_hash.nil?
                return nil
            end
            if (not res_json_hash['hits'].kind_of?(Array)) || res_json_hash['hits'].size == 0
                return res_json_hash
            end
            hash_to_append = res_json_hash['hits'][0]['recipe']
            hash_to_append['title'] = res_json_hash['hits'][0]['recipe']['label']
            hash_to_append['calories'] = (res_json_hash['hits'][0]['recipe']['calories'] / res_json_hash['hits'][0]['recipe']['yield']).round(0)
            hash_to_append['readyInMinutes'] = res_json_hash['hits'][0]['recipe']['totalTime'].round(0)
            hash_to_append['groceries'] = res_json_hash['hits'][0]['recipe']['ingredients']
            hash_to_append['links'] = [res_json_hash['hits'][0]['recipe']['shareAs'], res_json_hash['hits'][0]['recipe']['url']]
            hash_to_append['slot'] = idx+1
            hash_to_append['day'] = 1
            res['items'].append(hash_to_append)
        end
        return res
    end

    
        
end