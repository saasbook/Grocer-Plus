class AddColumnsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :type, :string
    add_column :recipes, :title, :string
  	add_column :recipes, :calories, :integer
  	add_column :recipes, :time, :integer
  	add_column :recipes, :cost, :decimal
  end
end
