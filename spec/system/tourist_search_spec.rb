# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'touristTour', type: :system, js: true do
  let(:tourist) { create(:tourist) }

  describe '検索機能' do
    context '検索結果の表示' do
      before do
        login tourist
        visit tourist_tourist_tours_path(tourist)
      end
      it '検索結果の表示' do
        fill_in 'search[city]', with: 'シカゴ'
        click_on 'ツアー都市'
        expect(page).to have_content 'シカゴ'
        expect(current_path).to eq(tourist_tourist_searches_city_path(tourist))
      end
    end
  end
end
