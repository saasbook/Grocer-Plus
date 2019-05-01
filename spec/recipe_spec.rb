require 'rails_helper'
describe ".find_in_api" do
  ret = {'hits' => 
  [
  {'recipe' => {
    'day' => 1,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'slot' => 1,
   'id' => 123456,
   'title' => "Eggs Benedict",
   'calories' => 200,
   'totalTime' => 45,
   'price' => 2,
   'yield' => 4
   }},	
  {'recipe' => {
    'day' => 1,
  'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'slot' => 2,
   'id' => 123456,
   'title' => "Sweet & Sour Soup",
   'calories' => 340,
   'totalTime' => 50,
  'price' => 3,
  'yield' => 4
  }},	
   {'recipe' => {
     'day'=> 1,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'slot' => 3,
   'id' => 123456,
   'title' => "Mushroom Risotto",
   'calories' => 200,
   'totalTime' => 75,
   'price' => 8,
   'yield' => 4
   }},
   {'recipe' => {
   'day'=> 2,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'slot' => 1,
   'id' => 123456,
   'title' => "waffles",
   'calories' => 200,
   'totalTime' => 45,
   'price' => 8,
   'yield' => 4
   }},
   {'recipe' => {
   'day'=> 2,
   'slot' => 2,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'id' => 123456,
   'title' => "salad",
   'calories' => 200,
   'totalTime' => 45,
   'price' => 8,
   'yield' => 4	
   }
  },
  {'recipe' => {
   'day'=> 2,
   'slot' => 3,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'id' => 123456,
   'title' => "burrito",
   'calories' => 200,
   'totalTime' => 45,
   'price' => 8,
   'yield' => 4	
   }},
   {'recipe' => {
   'day'=> 3,
   'slot' => 1,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'id' => 123456,
   'title' => "grapes",
   'calories' => 200,
   'totalTime' => 45,
   'price' => 8,
   'yield' => 4
   }},
   {'recipe' => {
   'day'=> 3,
   'slot' => 2,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'id' => 123456,
   'title' => "cherries",
   'calories' => 200,
   'totalTime' => 45,
   'price' => 8,
   'yield' => 4	
   }},
   {'recipe' => {
   'day'=> 3,
   'slot' => 3,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'id' => 123456,
   'title' => "milk",
   'calories' => 200,
   'totalTime' => 45,
   'price' => 8,
   'yield' => 4	
   }}
]
}

  before(:each) do
    stub_request(:get, %r{https://api\.edamam\.com/search.*}).
    #%r{https://api\.edamam\.com/search?q=breakfast.*}
    #'https://api.edamam.com/search?q=lunch'
    #'https://api.edamam.com/search?q=dinner'

      with(  headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Host'=>'api.edamam.com',
      'User-Agent'=>'Ruby'
       }).
      to_return(status: 200, body: JSON.generate(ret), headers: {"Content-Type"=> "application/json"})
    
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
  