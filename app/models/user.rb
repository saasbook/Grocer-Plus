class User < ActiveRecord::Base
  has_many :recipes, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
