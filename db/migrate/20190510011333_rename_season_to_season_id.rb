class RenameSeasonToSeasonId < ActiveRecord::Migration
  def change
    rename_column :users, :cuisine, :dietary_preferences
  end
end