class DishResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dish_name, :string
  attribute :cuisine_type, :string

  # Direct associations

  has_many   :very_bests

  # Indirect associations

  many_to_many :expert_preparers,
               resource: VenueResource

  many_to_many :fans,
               resource: UserResource

end
