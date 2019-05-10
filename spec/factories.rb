FactoryBot.define do

    factory :plan_recipe do
        type { "PlanRecipe" }
        title { "Eggs Benedict" }
        calories { 200 }
        time { 45 }
        meal_type { "breakfast" }
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
