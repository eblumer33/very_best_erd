class VenueResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :address, :string
  attribute :neighborhood, :string
  attribute :state, :string

  # Direct associations

  has_many   :very_bests

  # Indirect associations

end
