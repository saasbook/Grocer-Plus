FactoryBot.define do
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
    end
end