class Dish < ApplicationRecord
  # Direct associations

  has_many   :very_bests,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dish_name
  end

end
