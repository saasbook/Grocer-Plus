class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_and_belongs_to_many :recipes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def get_my_favorited_recipes
  #   return 
    
end
