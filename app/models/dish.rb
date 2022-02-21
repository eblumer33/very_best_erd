class Dish < ApplicationRecord
  # Direct associations

  has_many   :very_bests,
             :dependent => :destroy

  # Indirect associations

  has_many   :expert_preparers,
             :through => :very_bests,
             :source => :venue

  has_many   :fans,
             :through => :very_bests,
             :source => :user

  # Validations

  # Scopes

  def to_s
    dish_name
  end

end
