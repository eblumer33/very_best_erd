class Venue < ApplicationRecord
  # Direct associations

  has_many   :very_bests,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
