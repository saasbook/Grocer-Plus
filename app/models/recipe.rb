class Recipe < ActiveRecord::Base
    def self.find_in_api
        uri = URI('http://www.example.com')
        response = Net::HTTP.get_response(uri)
        return response
    end
end
