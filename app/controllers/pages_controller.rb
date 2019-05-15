class PagesController < ApplicationController
  def home
    if current_user and current_user.recipes.blank? 
      redirect_to edit_path
    elsif current_user and current_user.recipes 
      redirect_to show_path
    end
  end
end
