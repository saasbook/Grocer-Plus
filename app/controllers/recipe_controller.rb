class RecipeController < ApplicationController
  def signup
    # user will sign up for an account (user object stores email addr/password/recipes?)
    # user will indicate food preferences (create recipe object matching API with params=preferences)
  end

  def index
    # user will be able to see all recipes for them (use existing recipe object from signup to GET from api)
    # user can click on a button to go to the edit page
  end

  def edit    
    # user will be able to update food preferences (update existing recipe object for the user)
    # user can click on a refresh button and redirect to the index page
  end
end
