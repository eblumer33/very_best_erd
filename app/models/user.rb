class User < ApplicationRecord
  
  include JwtToken
# Direct associations

  has_many   :very_bests,
             :dependent => :destroy

  # Indirect associations

  has_many   :favorite_dishes,
             :through => :very_bests,
             :source => :dish

  has_many   :expert_preparers,
             :through => :favorite_dishes,
             :source => :expert_preparers

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
