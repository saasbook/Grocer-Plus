require 'rails_helper'
describe Hash do
    it "should return a blank instance" do
      Hash.new.should == {}
    end
  end