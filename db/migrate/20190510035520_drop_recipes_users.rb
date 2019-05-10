class DropRecipesUsers < ActiveRecord::Migration
  def change
    drop_table :recipes_users
  end
end
