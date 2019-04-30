require 'rails_helper'

describe UsersController, :type => :controller do
  s = {1=>{"Monday"=>{"day"=>1, "mealPlanId"=>0, "slot"=>1, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":651958,\"imageType\":\"jpg\",\"title\":\"Mini frittatas with quinoa\"}", "id"=>651958, "title"=>"Mini frittatas with quinoa", "calories"=>47, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/651958-556x370.jpg", "price"=>20.83}, "Tuesday"=>{"day"=>2, "mealPlanId"=>0, "slot"=>1, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":663867,\"imageType\":\"jpg\",\"title\":\"Tropical Steel Cut Oatmeal\"}", "id"=>663867, "title"=>"Tropical Steel Cut Oatmeal", "calories"=>462, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/663867-556x370.jpg", "price"=>165.81}, "Wednesday"=>{"day"=>3, "mealPlanId"=>0, "slot"=>1, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":639131,\"imageType\":\"jpg\",\"title\":\"Chocolate Overnight Oats & Berries\"}", "id"=>639131, "title"=>"Chocolate Overnight Oats & Berries", "calories"=>346, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/639131-556x370.jpg", "price"=>287.05}, "Thursday"=>{"day"=>4, "mealPlanId"=>0, "slot"=>1, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":641255,\"imageType\":\"jpg\",\"title\":\"Dark Chocolate Chunk Quinoa Granola Bars\"}", "id"=>641255, "title"=>"Dark Chocolate Chunk Quinoa Granola Bars", "calories"=>314, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/641255-556x370.jpg", "price"=>82.54}, "Friday"=>{"day"=>5, "mealPlanId"=>0, "slot"=>1, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":636080,\"imageType\":\"jpg\",\"title\":\"Breakfast Sticky Buns\"}", "id"=>636080, "title"=>"Breakfast Sticky Buns", "calories"=>123, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/636080-556x370.jpg", "price"=>76.44}, "Saturday"=>{"day"=>6, "mealPlanId"=>0, "slot"=>1, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":641978,\"imageType\":\"jpg\",\"title\":\"Easy Granola\"}", "id"=>641978, "title"=>"Easy Granola", "calories"=>111, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/641978-556x370.jpg", "price"=>13.7}, "Sunday"=>{"day"=>7, "mealPlanId"=>0, "slot"=>1, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":636062,\"imageType\":\"jpg\",\"title\":\"Breakfast Porridge\"}", "id"=>636062, "title"=>"Breakfast Porridge", "calories"=>346, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/636062-556x370.jpg", "price"=>121.34}}, 2=>{"Monday"=>{"day"=>1, "mealPlanId"=>0, "slot"=>2, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":659081,\"imageType\":\"jpg\",\"title\":\"Salmon Frittata\"}", "id"=>659081, "title"=>"Salmon Frittata", "calories"=>617, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/659081-556x370.jpg", "price"=>402.62}, "Tuesday"=>{"day"=>2, "mealPlanId"=>0, "slot"=>2, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":654939,\"imageType\":\"jpg\",\"title\":\"Pasta With Roasted Vegetables & Greek Olives\"}", "id"=>654939, "title"=>"Pasta With Roasted Vegetables & Greek Olives", "calories"=>272, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/654939-556x370.jpg", "price"=>284.85}, "Wednesday"=>{"day"=>3, "mealPlanId"=>0, "slot"=>2, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":649921,\"imageType\":\"jpg\",\"title\":\"Lentil Fritters (Parippu Vada)\"}", "id"=>649921, "title"=>"Lentil Fritters (Parippu Vada)", "calories"=>350, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/649921-556x370.jpg", "price"=>95.24}, "Thursday"=>{"day"=>4, "mealPlanId"=>0, "slot"=>2, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":660290,\"imageType\":\"jpg\",\"title\":\"Slow Cooker Lamb Curry\"}", "id"=>660290, "title"=>"Slow Cooker Lamb Curry", "calories"=>567, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/660290-556x370.jpg", "price"=>354.96}, "Friday"=>{"day"=>5, "mealPlanId"=>0, "slot"=>2, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":642585,\"imageType\":\"jpg\",\"title\":\"Farfalle with fresh tomatoes, basil and mozzarella\"}", "id"=>642585, "title"=>"Farfalle with fresh tomatoes, basil and mozzarella", "calories"=>556, "readyInMinutes"=>15, "image"=>"https://spoonacular.com/recipeImages/642585-556x370.jpg", "price"=>97.12}, "Saturday"=>{"day"=>6, "mealPlanId"=>0, "slot"=>2, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":633244,\"imageType\":\"jpg\",\"title\":\"Baby Spinach With Fettuccini, Apricots & Walnuts\"}", "id"=>633244, "title"=>"Baby Spinach With Fettuccini, Apricots & Walnuts", "calories"=>701, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/633244-556x370.jpg", "price"=>333.61}, "Sunday"=>{"day"=>7, "mealPlanId"=>0, "slot"=>2, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":639401,\"imageType\":\"jpg\",\"title\":\"Cider-Braised Pork Shoulder With Caramelized Onion and Apple Confit\"}", "id"=>639401, "title"=>"Cider-Braised Pork Shoulder With Caramelized Onion and Apple Confit", "calories"=>466, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/639401-556x370.jpg", "price"=>228.33}}, 3=>{"Monday"=>{"day"=>1, "mealPlanId"=>0, "slot"=>3, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":646499,\"imageType\":\"jpg\",\"title\":\"Healthy Orange Chicken\"}", "id"=>646499, "title"=>"Healthy Orange Chicken", "calories"=>440, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/646499-556x370.jpg", "price"=>303.88}, "Tuesday"=>{"day"=>2, "mealPlanId"=>0, "slot"=>3, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":652594,\"imageType\":\"jpg\",\"title\":\"Mung Bean Sprout and Quinoa Salad\"}", "id"=>652594, "title"=>"Mung Bean Sprout and Quinoa Salad", "calories"=>358, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/652594-556x370.jpg", "price"=>147.18}, "Wednesday"=>{"day"=>3, "mealPlanId"=>0, "slot"=>3, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":658615,\"imageType\":\"jpg\",\"title\":\"Roasted Peppers, Spinach & Feta Pizza\"}", "id"=>658615, "title"=>"Roasted Peppers, Spinach & Feta Pizza", "calories"=>397, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/658615-556x370.jpg", "price"=>387.46}, "Thursday"=>{"day"=>4, "mealPlanId"=>0, "slot"=>3, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":646185,\"imageType\":\"jpg\",\"title\":\"Ham and Red Bean Soup\"}", "id"=>646185, "title"=>"Ham and Red Bean Soup", "calories"=>212, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/646185-556x370.jpg", "price"=>169.86}, "Friday"=>{"day"=>5, "mealPlanId"=>0, "slot"=>3, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":632983,\"imageType\":\"jpg\",\"title\":\"Assam Fish Curry\"}", "id"=>632983, "title"=>"Assam Fish Curry", "calories"=>413, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/632983-556x370.jpg", "price"=>458.0}, "Saturday"=>{"day"=>6, "mealPlanId"=>0, "slot"=>3, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":652335,\"imageType\":\"jpg\",\"title\":\"Mongolian Beef\"}", "id"=>652335, "title"=>"Mongolian Beef", "calories"=>280, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/652335-556x370.jpg", "price"=>291.29}, "Sunday"=>{"day"=>7, "mealPlanId"=>0, "slot"=>3, "position"=>0, "type"=>"RECIPE", "value"=>"{\"id\":659679,\"imageType\":\"jpg\",\"title\":\"Seared Scallops With Wilted Greens\"}", "id"=>659679, "title"=>"Seared Scallops With Wilted Greens", "calories"=>281, "readyInMinutes"=>45, "image"=>"https://spoonacular.com/recipeImages/659679-556x370.jpg", "price"=>261.67}}}
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
    describe "test for the show method" do
      it "Should render the meal plan view" do
        user = create(:user)
        allow(controller).to receive(:current_user).and_return(user)
        allow(UsersController).to receive(:calc_calories).and_return(2000)
        expect(Recipe).to receive(:find_in_api).and_return(ret)
        expect(UsersController).to receive(:do_daily_recipes).and_return(s)
        get 'show'
      end
    end

  end
