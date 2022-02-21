require 'rails_helper'

RSpec.describe "very_bests#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/very_bests", params: params
  end

  describe 'basic fetch' do
    let!(:very_best1) { create(:very_best) }
    let!(:very_best2) { create(:very_best) }

    it 'works' do
      expect(VeryBestResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['very_bests'])
      expect(d.map(&:id)).to match_array([very_best1.id, very_best2.id])
    end
  end
end
