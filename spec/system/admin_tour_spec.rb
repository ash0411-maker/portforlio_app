# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admintour', type: :system, js: true do
  let(:admin) { create(:admin) }
  let(:tour) { create(:tour) }

  describe 'AdminTour関連ページ' do
    context 'tour詳細ページ' do
      it 'tour詳細ページへ遷移する' do
        login admin
        visit admin_tour_path(tour)
        expect(current_path).to eq(admin_tour_path(tour))
      end
      it 'ログインなしで詳細ページに遷移しない' do
        visit admin_tour_path(tour)
        expect(current_path).to eq(new_admin_session_path)
      end
    end

    context 'tour一覧ページ' do
      it 'tour一覧ページへ遷移する' do
        login admin
        visit admin_tours_path
        expect(current_path).to eq(admin_tours_path)
      end
      it 'ログインなしで詳細ページに遷移しない' do
        visit admin_tours_path
        expect(current_path).to eq(new_admin_session_path)
      end
    end

    context 'tour 販売ステータス変更' do
      it '販売停止' do
        login admin
        visit admin_tour_path(tour)
        find('#tour_is_active_false').click
        click_button '更新'
        expect(page).to have_content '販売停止'
      end
      it '販売' do
        login admin
        visit admin_tour_path(tour)
        find('#tour_is_active_true').click
        click_button '更新'
        expect(page).to have_checked_field 'tour_is_active_true'
      end
    end

    context 'city投稿ページ' do
      it 'tour一覧ページへ遷移する' do
        login admin
        visit admin_cities_path
        expect(current_path).to eq(admin_cities_path)
      end
      it 'ログインなしで詳細ページに遷移しない' do
        visit admin_cities_path
        expect(current_path).to eq(new_admin_session_path)
      end
      it 'city投稿に成功する' do
        login admin
        visit admin_cities_path
        fill_in 'city[name]', with: Faker::Address.city
        click_on '追加'
        expect(page)
          .to have_content '新たな都市を追加しました。'
      end
      it 'city投稿　同じ名前の都市があるから失敗する' do
        login admin
        visit admin_cities_path
        fill_in 'city[name]', with: '京都'
        click_on '追加'
        expect(page).to have_content 'エラー'
      end
      it 'city投稿　空白で投稿すると失敗する' do
        login admin
        visit admin_cities_path
        fill_in 'city[name]', with: ''
        click_on '追加'
        expect(page).to have_content 'エラー'
      end
    end
  end
end
