require 'rails_helper'
describe ".find_in_api" do
  ret = { "this": "is a test" }
  before(:each) do
    stub_request(:get, "http://www.example.com").
      with(  headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Host'=>'www.example.com',
      'User-Agent'=>'Ruby'
        }).
      to_return(status: 200, body: JSON.generate(ret), headers: {"Content-Type"=> "application/json"})
  end
  
  it 'should be a 200 OK' do
    expect(Recipe.find_in_api.code).to eq "200"
  end
  it 'should return a string' do
    expect(Recipe.find_in_api.body).to be_an_instance_of(String)
  end
  it 'should include "is a test" in body' do
    expect(Recipe.find_in_api.body).to include('is a test')
  end
end
  #describe ".get_announcements" do
    #before { @result = FactoryGirl.create(:announcement) }
  #  it "return announcement" do
   #   Announcement.get_announcements.should_not be_empty
    #end
  #end