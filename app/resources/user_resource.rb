class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :very_bests

  # Indirect associations

  has_many :expert_preparers, resource: VenueResource do
    assign_each do |user, venues|
      venues.select do |v|
        v.id.in?(user.expert_preparers.map(&:id))
      end
    end
  end


  filter :dish_id, :integer do
    eq do |scope, value|
      scope.eager_load(:expert_preparers).where(:very_bests => {:dish_id => value})
    end
  end
end
