require 'rails_helper'

RSpec.describe "very_bests#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/very_bests/#{very_best.id}"
  end

  describe 'basic destroy' do
    let!(:very_best) { create(:very_best) }

    it 'updates the resource' do
      expect(VeryBestResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { VeryBest.count }.by(-1)
      expect { very_best.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
