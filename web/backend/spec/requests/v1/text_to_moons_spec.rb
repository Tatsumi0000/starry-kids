require 'rails_helper'

RSpec.describe 'V1::TextToMoons', type: :request do
  describe 'GET v1/text_to_moons' do
    let(:headers) { { 'ACCEPT' => 'application/json' } }
    let(:params) { { text: 'test', size: 1 } }

    context 'validationに引っかかるリクエストを送る場合' do
      it '400エラーがかえること' do
        get('/v1/text_to_moons', headers:, params:)
        expect(response).to have_http_status(:bad_request)
      end
    end

    context '正しいリクエスト「{text: "text", size: 20}」を送る場合' do
      let(:params) { { text: 'test', size: 20 } }

      it '200が返ってくること' do
        get('/v1/text_to_moons', headers:, params:)
        expect(response).to have_http_status(:ok)
      end

      it 'textとsizeが返ってくること' do
        get('/v1/text_to_moons', headers:, params:)
        expect(JSON.parse(response.body)['text']).to eq 'test'
        expect(JSON.parse(response.body)['size']).to eq 20
      end

      it '「test」の文字数4つ分の配列が返っている' do
        get('/v1/text_to_moons', headers:, params:)
        expect(JSON.parse(response.body)['response'].length).to eq 4
      end
    end
  end
end
