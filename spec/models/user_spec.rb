require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:very_bests) }

    end

    describe "InDirect Associations" do

    it { should have_many(:favorite_dishes) }

    it { should have_many(:expert_preparers) }

    end

    describe "Validations" do

    end
end
