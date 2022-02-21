class VeryBest < ApplicationRecord
  # Direct associations

  belongs_to :dish

  belongs_to :venue,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
