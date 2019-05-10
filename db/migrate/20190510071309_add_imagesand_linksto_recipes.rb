class AddImagesandLinkstoRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :image, :string
    add_column :recipes, :link, :string
  end
end
