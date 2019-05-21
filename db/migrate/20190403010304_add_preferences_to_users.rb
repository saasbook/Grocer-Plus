class AddPreferencesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :age, :integer
  	add_column :users, :gender, :string
  	add_column :users, :weight, :integer
  	add_column :users, :height, :integer
  	add_column :users, :exercise, :string
  	add_column :users, :goal, :string
  	add_column :users, :budget, :integer
  	add_column :users, :time, :integer
  	add_column :users, :cuisine, :string
  end
end
