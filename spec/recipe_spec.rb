require 'rails_helper'
describe ".find_in_api" do
  ret = {'items' => 
  [
  {'day' => 1,
   'slot' => 1,
   'id' => 123456,
   'title' => "Eggs Benedict",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 2
   },	
  {'day' => 1,
   'slot' => 2,
   'id' => 123456,
   'title' => "Sweet & Sour Soup",
   'calories' => 340,
   'readyInMinutes' => 50,
  'price' => 3
  },	
   {'day'=> 1,
   'slot' => 3,
   'id' => 123456,
   'title' => "Mushroom Risotto",
   'calories' => 200,
   'readyInMinutes' => 75,
   'price' => 8	
   },
   {'day'=> 2,
   'slot' => 1,
   'id' => 123456,
   'title' => "waffles",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 8	
   },
   {'day'=> 2,
   'slot' => 2,
   'id' => 123456,
   'title' => "salad",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 8	
   },
   {'day'=> 2,
   'slot' => 3,
   'id' => 123456,
   'title' => "burrito",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 8	
   },
   {'day'=> 3,
   'slot' => 1,
   'id' => 123456,
   'title' => "grapes",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 8
   },
   {'day'=> 3,
   'slot' => 2,
   'id' => 123456,
   'title' => "cherries",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 8	
   },
   {'day'=> 3,
   'slot' => 3,
   'id' => 123456,
   'title' => "milk",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 8	
   }
]
}
  ret2 = [
    {'image' => 'hi.png',
     'readyInMinutes' => 45,
     'pricePerServing' => 2
     }
    ]
  ret3 = {'calories' => 100}

  before(:each) do
    stub_request(:get, %r{https://spoonacular-recipe-food-nutrition-v1\.p\.rapidapi\.com/recipes/mealplans/generate.*}).
      with(  headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Host'=>'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
      'User-Agent'=>'Ruby',
      'X-RapidAPI-Host'=> 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
      'X-RapidAPI-Key'=> ENV['SPOONACULAR_API_KEY']
       }).
      to_return(status: 200, body: JSON.generate(ret), headers: {"Content-Type"=> "application/json"})

    stub_request(:get, %r{https://spoonacular-recipe-food-nutrition-v1\.p\.rapidapi\.com/recipes/informationBulk.*}).
      with(  headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Host'=>'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
      'User-Agent'=>'Ruby',
      'X-RapidAPI-Host'=> 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
      'X-RapidAPI-Key'=> ENV['SPOONACULAR_API_KEY']
       }).
      to_return(status: 200, body: JSON.generate(ret2), headers: {"Content-Type"=> "application/json"})

    stub_request(:get, %r{https://spoonacular-recipe-food-nutrition-v1\.p\.rapidapi\.com/recipes/\d+?/nutritionWidget.json}).
      with(  headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Host'=>'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
      'User-Agent'=>'Ruby',
      'X-RapidAPI-Host'=> 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
      'X-RapidAPI-Key'=> ENV['SPOONACULAR_API_KEY']
       }).
      to_return(status: 200, body: JSON.generate(ret3), headers: {"Content-Type"=> "application/json"})
    
  end
  
 # it 'should be a 200 OK' do
  #  byebug
  #  expect(Recipe.find_in_api(1,1,1).code).to eq "200"
  #end
  it 'should return a Hash' do
    expect(Recipe.find_in_api(1,1,1)).to be_an_instance_of(Hash)
  end
  it 'should include "is a test" in body' do
    expect(Recipe.find_in_api(1,1,1)).to include('items')
  end
end
  #describe ".get_announcements" do
    #before { @result = FactoryGirl.create(:announcement) }
  #  it "return announcement" do
   #   Announcement.get_announcements.should_not be_empty
    #end
  #end