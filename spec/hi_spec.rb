require 'rails_helper'
describe Hash do
    it "should return a blank instance" do
      Hash.new.should == {}
    end
  end


describe UsersController do
    it "Should calculate calories for men" do
    	UsersController.calc_calories('Male', 80, 180, 25, 'Light', 'Maintain') == 2481.875
    end
  end

describe UsersController do
    it "Should calculate calories for varying weight" do
    	UsersController.calc_calories('Male', 90, 180, 25, 'Light', 'Maintain') == 2619.375
    end
  end

describe UsersController do
    it "Should calculate calories for varying height" do
    	UsersController.calc_calories('Male', 80, 170, 25, 'Light', 'Maintain') == 2395.9375
    end
  end

describe UsersController do
    it "Should calculate calories for varying ages" do
    	UsersController.calc_calories('Male', 80, 180, 40, 'Light', 'Maintain') == 2378.75
    end
  end

describe UsersController do
    it "Should calculate calories for moderate exercise level" do
    	UsersController.calc_calories('Male', 80, 180, 25, 'Moderate', 'Maintain') == 2797.75
    end
  end

describe UsersController do
    it "Should calculate calories for heavy exercise level" do
    	UsersController.calc_calories('Male', 80, 180, 25, 'Heavy', 'Maintain') == 3113.624
    end
  end

describe UsersController do
    it "Should calculate calories for losing weight" do
    	UsersController.calc_calories('Male', 80, 180, 25, 'Light', 'Lose') == 1981.875
    end
  end

describe UsersController do
    it "Should calculate calories for gaining weight" do
    	UsersController.calc_calories('Male', 80, 180, 25, 'Light', 'Gain') == 2981.875
    end
  end

describe UsersController do
    it "Should calculate calories for women" do
    	UsersController.calc_calories('Female', 80, 180, 25, 'Light', 'Maintain') == 2315.875
    end
  end