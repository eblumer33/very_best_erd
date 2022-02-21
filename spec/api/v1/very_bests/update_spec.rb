require 'rails_helper'

RSpec.describe "very_bests#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/very_bests/#{very_best.id}", payload
  end

  describe 'basic update' do
    let!(:very_best) { create(:very_best) }

    let(:payload) do
      {
        data: {
          id: very_best.id.to_s,
          type: 'very_bests',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(VeryBestResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { very_best.reload.attributes }
    end
  end
end
