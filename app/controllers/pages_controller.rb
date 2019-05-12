class PagesController < ApplicationController
  def home
    if current_user and current_user.recipes.blank? 
      redirect_to edit_path
    elsif current_user and current_user.recipes 
      redirect_to show_path
    else
      redirect_to new_user_registration_path
    end
  end
end
