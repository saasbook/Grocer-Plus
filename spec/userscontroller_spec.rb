require 'rails_helper'

describe UsersController, :type => :controller do
    #it "calls the model method that performs spoonacular search" do
    #    user = create(:user)
    #    allow(controller).to receive(:current_user).and_return(user)
    #    allow(UsersController).to receive(:calc_calories).and_return(2000)
    #    expect(Recipe).to receive(:find_in_api).with(2000, 100, 30)
    #    get 'show'
    #end
    #it 'selects the show template for rendering'
    #it 'makes the api search results available to that template'
    describe "Calculate Calories" do
      it "Should calculate calories for men" do
        UsersController.calc_calories('Male', 80, 180, 25, 'Light', 'Maintain') == 2481.875
      end

      it "Should calculate calories for varying weight" do
        UsersController.calc_calories('Male', 90, 180, 25, 'Light', 'Maintain') == 2619.375
      end

      it "Should calculate calories for varying height" do
        UsersController.calc_calories('Male', 80, 170, 25, 'Light', 'Maintain') == 2395.9375
      end

      it "Should calculate calories for varying ages" do
        UsersController.calc_calories('Male', 80, 180, 40, 'Light', 'Maintain') == 2378.75
      end

      it "Should calculate calories for moderate exercise level" do
        UsersController.calc_calories('Male', 80, 180, 25, 'Moderate', 'Maintain') == 2797.75
      end

      it "Should calculate calories for heavy exercise level" do
        UsersController.calc_calories('Male', 80, 180, 25, 'Heavy', 'Maintain') == 3113.624
      end

      it "Should calculate calories for losing weight" do
        UsersController.calc_calories('Male', 80, 180, 25, 'Light', 'Lose') == 1981.875
      end

      it "Should calculate calories for gaining weight" do
        UsersController.calc_calories('Male', 80, 180, 25, 'Light', 'Gain') == 2981.875
      end

      it "Should calculate calories for women" do
        UsersController.calc_calories('Female', 80, 180, 25, 'Light', 'Maintain') == 2315.875
      end
    end
    describe "Favorite a Recipe" do

      before(:each) do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        get 'favorite_recipe', {:Type => "Breakfast", :Title => "Eggs Benedict", :Calories => 100, :PrepTime => 60, :Cost => 2.50}
      end

      it "saves the recipe as favorited by the current user" do
        expect(FavoritedRecipe.where(:title =>"Eggs Benedict")).to be_present
      end

      it "redirects to the favorited_recipes template" do
        expect(controller).to redirect_to(:favorited_recipes)
      end

    end

    describe "Favorited Recipes" do

      before(:each) do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        @fake_results = [instance_double(Recipe), instance_double(Recipe)]
        allow(user).to receive_message_chain(:recipes, :where).and_return(@fake_results)
        get 'favorited_recipes'
      end

      it "selects the Favorited Recipes template for rendering" do
        expect(controller).to render_template(:favorited_recipes)
      end 

      it "makes the favorited recipes available to that template" do
        expect(assigns(:favorited_recipes)).to eq(@fake_results)
      end 

    end

  end
