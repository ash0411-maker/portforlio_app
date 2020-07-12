# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AdminTourist', type: :system, js: true do
  let(:admin) { create(:admin) }
  let(:tourist) { create(:tourist) }

  describe 'Toutist関連ページ' do
    context 'Tourist詳細ページ' do
      it 'Tourist詳細ページへ遷移する' do
        login admin
        visit admin_tourist_path(tourist)
        expect(current_path).to eq(admin_tourist_path(tourist))
      end
      it 'ログインなしで詳細ページに遷移しない' do
        visit admin_tourist_path(tourist)
        expect(current_path).to eq(new_admin_session_path)
      end
    end

    context 'Tourist一覧ページ' do
      it 'Tourist一覧ページへ遷移する' do
        login admin
        visit admin_tourists_path
        expect(current_path).to eq(admin_tourists_path)
      end
      it 'ログインなしで詳細ページに遷移しない' do
        visit admin_tourists_path
        expect(current_path).to eq(new_admin_session_path)
      end
    end

    context 'Tourist 会員ステータス変更' do
      it '退会' do
        login admin
        visit admin_tourist_path(tourist)
        find('#tourist_deleted_at_1').click
        click_button '更新'
        expect(page).to have_content '退会させました'
      end
      it '復活' do
        login admin
        visit admin_tourist_path(tourist)
        find('#tourist_deleted_at_0').click
        click_button '更新'
        expect(page).to have_content '会員を再開させました'
      end
    end
  end
end
