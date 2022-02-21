require "rails_helper"

RSpec.describe VeryBestResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "very_bests",
          attributes: {},
        },
      }
    end

    let(:instance) do
      VeryBestResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { VeryBest.count }.by(1)
    end
  end

  describe "updating" do
    let!(:very_best) { create(:very_best) }

    let(:payload) do
      {
        data: {
          id: very_best.id.to_s,
          type: "very_bests",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      VeryBestResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { very_best.reload.updated_at }
      # .and change { very_best.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:very_best) { create(:very_best) }

    let(:instance) do
      VeryBestResource.find(id: very_best.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { VeryBest.count }.by(-1)
    end
  end
end
