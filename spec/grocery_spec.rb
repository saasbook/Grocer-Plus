require 'rails_helper'

describe Grocery, :type => :model do
    it "should have to_string method" do
        expect(Grocery.create(:name => "toast", :weight_in_grams => 200).to_s).to eq "name: toast, weight(g): 200.0"
    end
end