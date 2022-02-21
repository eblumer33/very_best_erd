require "rails_helper"

RSpec.describe VeryBestResource, type: :resource do
  describe "serialization" do
    let!(:very_best) { create(:very_best) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(very_best.id)
      expect(data.jsonapi_type).to eq("very_bests")
    end
  end

  describe "filtering" do
    let!(:very_best1) { create(:very_best) }
    let!(:very_best2) { create(:very_best) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: very_best2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([very_best2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:very_best1) { create(:very_best) }
      let!(:very_best2) { create(:very_best) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      very_best1.id,
                                      very_best2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      very_best2.id,
                                      very_best1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
