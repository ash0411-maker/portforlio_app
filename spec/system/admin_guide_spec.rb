# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AdminGuide', type: :system, js: true do
  let(:admin) { create(:admin) }
  let(:guide) { create(:guide) }

  describe 'Guide関連ページ' do
    context 'guide詳細ページ' do
      it 'guide詳細ページへ遷移する' do
        login admin
        visit admin_guide_path(guide)
        expect(current_path).to eq(admin_guide_path(guide))
      end
      it 'ログインなしで詳細ページに遷移しない' do
        visit admin_guide_path(guide)
        expect(current_path).to eq(new_admin_session_path)
      end
    end

    context 'guide一覧ページ' do
      it 'guide一覧ページへ遷移する' do
        login admin
        visit admin_guides_path
        expect(current_path).to eq(admin_guides_path)
      end
      it 'ログインなしで詳細ページに遷移しない' do
        visit admin_guides_path
        expect(current_path).to eq(new_admin_session_path)
      end
    end

    context 'guide 会員ステータス変更' do
      it '退会' do
        login admin
        visit admin_guide_path(guide)
        find('#guide_deleted_at_1').click
        click_button '更新'
        expect(page).to have_content '退会させました'
      end
      it '復活' do
        login admin
        visit admin_guide_path(guide)
        find('#guide_deleted_at_0').click
        click_button '更新'
        expect(page).to have_content '会員を再開させました'
      end
    end
  end
end
