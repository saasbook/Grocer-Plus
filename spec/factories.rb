FactoryGirl.define do
    factory :user do
        email "aabb@hh.de"
        password "ruby123"
        height 1
        weight 1
        exercise "Light"
        age 12
        gender "male"
        goal "gain"
        budget 100
        time 30
        cuisine "spicy"
    end
end