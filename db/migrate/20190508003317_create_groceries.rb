class CreateGroceries < ActiveRecord::Migration
  def change
    create_table :groceries do |t|

      t.string :name
      t.float :weight_in_grams
      t.references :recipe, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
