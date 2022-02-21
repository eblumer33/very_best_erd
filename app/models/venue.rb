class Venue < ApplicationRecord
  # Direct associations

  has_many   :very_bests,
             dependent: :destroy

  # Indirect associations

  has_many   :popular_dishes,
             through: :very_bests,
             source: :dish

  has_many   :fans,
             through: :popular_dishes,
             source: :fans

  # Validations

  # Scopes

  def to_s
    name
  end
end
