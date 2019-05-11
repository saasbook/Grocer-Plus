require 'rails_helper'

describe UsersController, :type => :controller do
  s = {1=>{"Monday"=>{"day"=>1, "mealPlanId"=>0, "slot"=>1, "position"=>0, "type"=>"RECIPE", 
  "value"=>"{\"id\":651958,\"imageType\":\"jpg\",\"title\":\"Mini frittatas with quinoa\"}", "id"=>651958, 
  "title"=>"Mini frittatas with quinoa", "calories"=>47, "readyInMinutes"=>45, 
  "image"=>"https://spoonacular.com/recipeImages/651958-556x370.jpg",
  "groceries"=> [
        {
          "text": "6 cups watermelon chunks, seeded",
          "weight": 924.0
        },
        {
          "text": "5 tomatoes, cored and quartered",
          "weight": 615.0
        },
        {
          "text": "1 tablespoon sweet smoked paprika",
          "weight": 6.8
        }]
        }}, 
  2=>{"Monday"=>{"day"=>1, "mealPlanId"=>0, "slot"=>2, "position"=>0, "type"=>"RECIPE", 
  "value"=>"{\"id\":659081,\"imageType\":\"jpg\",\"title\":\"Salmon Frittata\"}", "id"=>659081, 
  "title"=>"Salmon Frittata", "calories"=>617, "readyInMinutes"=>45, 
  "image"=>"https://spoonacular.com/recipeImages/659081-556x370.jpg",
  "groceries"=> [
        {
          "text": "6 cups watermelon chunks, seeded",
          "weight": 924.0
        },
        {
          "text": "5 tomatoes, cored and quartered",
          "weight": 615.0
        },
        {
          "text": "1 tablespoon sweet smoked paprika",
          "weight": 6.8
        }]
        }}, 
  3=>{"Monday"=>{"day"=>1, "mealPlanId"=>0, "slot"=>3, "position"=>0, "type"=>"RECIPE", 
  "value"=>"{\"id\":646499,\"imageType\":\"jpg\",\"title\":\"Healthy Orange Chicken\"}", "id"=>646499, 
  "title"=>"Healthy Orange Chicken", "calories"=>440, "readyInMinutes"=>45, 
  "image"=>"https://spoonacular.com/recipeImages/646499-556x370.jpg",
  "groceries"=> [
        {
          "text": "6 cups watermelon chunks, seeded",
          "weight": 924.0
        },
        {
          "text": "5 tomatoes, cored and quartered",
          "weight": 615.0
        },
        {
          "text": "1 tablespoon sweet smoked paprika",
          "weight": 6.8
        }]
        }}}


  ret = {'items' => 
  [
  {'day' => 1,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'slot' => 1,
   'id' => 123456,
   'title' => "Eggs Benedict",
   'calories' => 200,
   'readyInMinutes' => 45,
   "groceries"=> [
        {
          "text": "6 cups watermelon chunks, seeded",
          "weight": 924.0
        },
        {
          "text": "5 tomatoes, cored and quartered",
          "weight": 615.0
        },
        {
          "text": "1 tablespoon sweet smoked paprika",
          "weight": 6.8
        }
    ]
   },	
  {'day' => 1,
  'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'slot' => 2,
   'id' => 123456,
   'title' => "Sweet & Sour Soup",
   'calories' => 340,
   'readyInMinutes' => 50,
   "groceries"=> [
        {
          "text": "6 cups watermelon chunks, seeded",
          "weight": 924.0
        },
        {
          "text": "5 tomatoes, cored and quartered",
          "weight": 615.0
        },
        {
          "text": "1 tablespoon sweet smoked paprika",
          "weight": 6.8
        }
    ]
  },	
   {'day'=> 1,
   'value' => '{"id":655340,"imageType":"jpg","title":"Peanut Butter Swirl Banana Bread"}',
   'slot' => 3,
   'id' => 123456,
   'title' => "Mushroom Risotto",
   'calories' => 200,
   'readyInMinutes' => 75,
   "groceries"=> [
        {
          "text": "6 cups watermelon chunks, seeded",
          "weight": 924.0
        },
        {
          "text": "5 tomatoes, cored and quartered",
          "weight": 615.0
        },
        {
          "text": "1 tablespoon sweet smoked paprika",
          "weight": 6.8
        }
    ]
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
        @fake_recipe = instance_double(Recipe)
        allow(user).to receive_message_chain(:recipes, :where).and_return(@fake_recipe)
        get 'favorited_recipes'
      end

      it "selects the Favorited Recipes template for rendering" do
        expect(controller).to render_template(:favorited_recipes)
      end 

      it "makes the favorited recipes available to that template" do
        expect(assigns(:breakfast)).to eq(@fake_recipe)
        expect(assigns(:lunch)).to eq(@fake_recipe)
        expect(assigns(:dinner)).to eq(@fake_recipe)
      end 

    end
    describe "Show action" do

      describe "involving API call" do

        before(:each) do
          user = create(:user_with_recipes)
          recipe = build(:plan_recipe)
          allow(controller).to receive(:current_user).and_return(user)
          allow(UsersController).to receive(:calc_calories).and_return(2000)
          allow(Recipe).to receive(:find_in_api).and_return(ret)
          allow(UsersController).to receive(:do_daily_recipes).and_return(s)
          allow(UsersController).to receive(:convert_to_recipe).and_return(recipe)
        end

        it "should render the meal plan view" do
          get 'show'
          expect(controller).to render_template(:show)
        end

        it "should commit displayed recipes to the database" do
          get 'show'
          user = User.where(:email => "john.apple@gmail.com").first
          expect(user.recipes.size).to eq(1) # ID is same (from factory), so only commits 1 recipe
        end

        it "should call API if user has no recipes in database" do
          expect(Recipe).to receive(:find_in_api)
          get "show"
        end

      end

      describe "not involving API call" do

        it "should not call API if user has recipes saved to database" do
          user = create(:user_with_recipes)
          breakfast_recipe = create(:plan_recipe, :user_id => 1)
          lunch_recipe = create(:plan_recipe, :user_id => 1, :id => 2)
          dinner_recipe = create(:plan_recipe, :user_id => 1, :id => 3)

          allow(controller).to receive(:current_user).and_return(user)
          allow(UsersController).to receive(:calc_calories).and_return(2000)
          expect(Recipe).not_to receive(:find_in_api)
          get "show"
        end

      end

    end

    describe "Grocery List" do

      before(:each) do
        @user = create(:user_with_recipes)
        recipe = build(:plan_recipe)
        allow(controller).to receive(:current_user).and_return(@user)
      end

      it "should render the grocery list view" do
        get 'grocery_list'
        expect(controller).to render_template(:grocery_list)
      end

      it "should make the meal plan recipes available to the grocery list template" do
        fake_recipe = instance_double(Recipe)
        allow(@user).to receive_message_chain(:recipes, :where).and_return(fake_recipe)
        get 'grocery_list'
        expect(assigns(:breakfast)).to eq(fake_recipe)
        expect(assigns(:lunch)).to eq(fake_recipe)
        expect(assigns(:dinner)).to eq(fake_recipe)
      end

    end

  end
