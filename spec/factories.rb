FactoryBot.define do

    factory :plan_recipe do
        type { "PlanRecipe" }
        title { "Eggs Benedict" }
        calories { 200 }
        time { 45 }
        meal_type { "breakfast" }
        image { "https://www.edamam.com/web-img/59e/59e3c358ff7f844909e8e5dae7a3299c.jpg" }
        link {  "http://www.edamam.com/recipe/tomato-and-bacon-breakfast-sandwiches-recipe-601fe3b9178e4df9a86d1aa7abf34550/breakfast/515-715-cal" }
        user
    end

    factory :user do
        email { "john.apple@gmail.com" }
        password { "hello1" }
        height { 60 }
        weight { 160 }
        exercise { "Light" }
        age { 21 }
        gender { "male" }
        goal { "gain" }
        budget { 100 }
        time { 30 }
        cuisine { "spicy" }
        
        factory :user_with_recipes do
            transient do
                recipes_count { 0 }
            end
            after(:create) do |user, evaluator|
                create_list(:recipe, evaluator.recipes_count, user: user)
            end
        end
    end
end
