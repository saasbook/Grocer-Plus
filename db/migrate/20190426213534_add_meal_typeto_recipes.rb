class AddMealTypetoRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :meal_type, :string
  end
end
