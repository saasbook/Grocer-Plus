require 'rails_helper'
describe ".find_in_api" do
  ret = { "this": "is a test" }
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
  end
  
  it 'should be a 200 OK' do
    expect(Recipe.find_in_api(1,1,1).code).to eq "200"
  end
  it 'should return a string' do
    expect(Recipe.find_in_api(1,1,1).body).to be_an_instance_of(String)
  end
  it 'should include "is a test" in body' do
    expect(Recipe.find_in_api(1,1,1).body).to include('is a test')
  end
end
  #describe ".get_announcements" do
    #before { @result = FactoryGirl.create(:announcement) }
  #  it "return announcement" do
   #   Announcement.get_announcements.should_not be_empty
    #end
  #end