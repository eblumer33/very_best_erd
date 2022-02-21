require "rails_helper"

RSpec.describe "very_bests#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/very_bests/#{very_best.id}", params: params
  end

  describe "basic fetch" do
    let!(:very_best) { create(:very_best) }

    it "works" do
      expect(VeryBestResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("very_bests")
      expect(d.id).to eq(very_best.id)
    end
  end
end
