class AddInstrLinkToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :instr_link, :string
  end
end
