# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'adminTour', type: :system, js: true do
  let(:admin) { create(:admin) }

  describe '検索機能' do
    context '検索結果の表示' do
      before do
        login admin
        visit admin_tours_path(admin)
      end
      it '予約検索結果の表示' do
        find('#search_model').find("option[value='order']").select_option
        find('#search_content').set('1')
        click_on 'ID検索'
        expect(current_path).to eq(admin_searches_result_path)
        expect(page).to have_content '予約ID'
      end
      it 'ツーリスト検索結果の表示' do
        find('#search_model').find("option[value='tourist']").select_option
        find('#search_content').set('1')
        click_on 'ID検索'
        expect(current_path).to eq(admin_searches_result_path)
        expect(page).to have_content 'ツーリストID'
      end
      it 'ガイド検索結果の表示' do
        find('#search_model').find("option[value='guide']").select_option
        find('#search_content').set('1')
        click_on 'ID検索'
        expect(current_path).to eq(admin_searches_result_path)
        expect(page).to have_content 'ガイドID'
      end
      it 'チャットルーム検索結果の表示' do
        find('#search_model').find("option[value='room']").select_option
        find('#search_content').set('1')
        click_on 'ID検索'
        expect(current_path).to eq(admin_searches_result_path)
        expect(page).to have_content 'チャットルームID'
      end
    end
  end
end
