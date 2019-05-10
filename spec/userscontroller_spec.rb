require 'rails_helper'

describe UsersController, :type => :controller do
  s = {1=>{"Monday"=>{"day"=>1, "mealPlanId"=>0, "slot"=>1, "position"=>0, "type"=>"RECIPE", 
  "value"=>"{\"id\":651958,\"imageType\":\"jpg\",\"title\":\"Mini frittatas with quinoa\"}", "id"=>651958, 
  "title"=>"Mini frittatas with quinoa", "calories"=>47, "readyInMinutes"=>45, 
  "image"=>"https://spoonacular.com/recipeImages/651958-556x370.jpg", "price"=>20.83}}, 
  2=>{"Monday"=>{"day"=>1, "mealPlanId"=>0, "slot"=>2, "position"=>0, "type"=>"RECIPE", 
  "value"=>"{\"id\":659081,\"imageType\":\"jpg\",\"title\":\"Salmon Frittata\"}", "id"=>659081, 
  "title"=>"Salmon Frittata", "calories"=>617, "readyInMinutes"=>45, 
  "image"=>"https://spoonacular.com/recipeImages/659081-556x370.jpg", "price"=>402.62}}, 
  3=>{"Monday"=>{"day"=>1, "mealPlanId"=>0, "slot"=>3, "position"=>0, "type"=>"RECIPE", 
  "value"=>"{\"id\":646499,\"imageType\":\"jpg\",\"title\":\"Healthy Orange Chicken\"}", "id"=>646499, 
  "title"=>"Healthy Orange Chicken", "calories"=>440, "readyInMinutes"=>45, 
  "image"=>"https://spoonacular.com/recipeImages/646499-556x370.jpg", "price"=>303.88}}}


  ret = {'items' => 
  [
  {'day' => 1,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'slot' => 1,
   'id' => 123456,
   'title' => "Eggs Benedict",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 2
   },	
  {'day' => 1,
  'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'slot' => 2,
   'id' => 123456,
   'title' => "Sweet & Sour Soup",
   'calories' => 340,
   'readyInMinutes' => 50,
  'price' => 3
  },	
   {'day'=> 1,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'slot' => 3,
   'id' => 123456,
   'title' => "Mushroom Risotto",
   'calories' => 200,
   'readyInMinutes' => 75,
   'price' => 8	
   },
   {'day'=> 2,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'slot' => 1,
   'id' => 123456,
   'title' => "waffles",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 8	
   },
   {'day'=> 2,
   'slot' => 2,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'id' => 123456,
   'title' => "salad",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 8	
   },
   {'day'=> 2,
   'slot' => 3,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'id' => 123456,
   'title' => "burrito",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 8	
   },
   {'day'=> 3,
   'slot' => 1,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'id' => 123456,
   'title' => "grapes",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 8
   },
   {'day'=> 3,
   'slot' => 2,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'id' => 123456,
   'title' => "cherries",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 8	
   },
   {'day'=> 3,
   'slot' => 3,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'id' => 123456,
   'title' => "milk",
   'calories' => 200,
   'readyInMinutes' => 45,
   'price' => 8	
   }
]
}

    #it "calls the model method that performs spoonacular search" do
    #    user = create(:user)
    #    allow(controller).to receive(:current_user).and_return(user)
    #    allow(UsersController).to receive(:calc_calories).and_return(2000)
    #    expect(Recipe).to receive(:find_in_api).with(2000)
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
    describe "Show action" do

      before(:each) do
        user = create(:user)
        recipe = create(:recipe)
        allow(controller).to receive(:current_user).and_return(user)
        allow(UsersController).to receive(:calc_calories).and_return(2000)
        allow(Recipe).to receive(:find_in_api).and_return(ret)
        allow(UsersController).to receive(:do_daily_recipes).and_return(s)
        allow(UsersController).to receive(:convert_to_recipe).and_return(recipe)
        get 'show'
      end

      it "Should render the meal plan view" do
        expect(controller).to render_template(:show)
      end

      it "Should commit displayed recipes to the database" do
        user = User.where(:email => "john.apple@gmail.com")
        expect(user.recipes.size).to eq(3)
      end


    end

  end
