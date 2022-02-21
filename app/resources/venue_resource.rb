class VenueResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :address, :string
  attribute :neighborhood, :string
  attribute :state, :string

  # Direct associations

  has_many :very_bests

  # Indirect associations

  many_to_many :popular_dishes,
               resource: DishResource

  has_many :fans, resource: UserResource do
    assign_each do |venue, users|
      users.select do |u|
        u.id.in?(venue.fans.map(&:id))
      end
    end
  end

  filter :user_id, :integer do
    eq do |scope, value|
      scope.eager_load(:fans).where(very_bests: { user_id: value })
    end
  end
end
