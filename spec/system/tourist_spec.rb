# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tourist', type: :system, js: true do
  let(:tourist) { create(:tourist) }
  let(:another_tourist) { create(:tourist) }

  describe 'Toutist関連ページ' do
    context 'Tourist詳細ページ' do
      it 'Tourist詳細ページへ遷移する' do
        login tourist
        visit tourist_tourist_path(tourist.id)
        expect(current_path).to eq(tourist_tourist_path(tourist.id))
      end
      it 'idが異なるからcurrent_touristの詳細ページへ遷移する' do
        login tourist
        visit tourist_tourist_path(another_tourist.id)
        expect(current_path).to eq(tourist_tourist_path(tourist.id))
      end
      it 'ログインなしで詳細ページに遷移しない' do
        visit tourist_tourist_path(tourist.id)
        expect(current_path).to eq(new_tourist_session_path)
      end
    end

    context 'Tourist編集ページ' do
      it 'Tourist編集ページへ遷移する' do
        login tourist
        visit edit_tourist_tourist_path(tourist.id)
        expect(current_path).to eq(edit_tourist_tourist_path(tourist.id))
      end
      it 'idが異なるからcurrent_touristの詳細ページへ遷移する' do
        login tourist
        visit edit_tourist_tourist_path(another_tourist.id)
        expect(current_path).to eq(tourist_tourist_path(tourist.id))
      end
      it 'ログインなしで編集ページに遷移しない' do
        visit edit_tourist_tourist_path(tourist.id)
        expect(current_path).to eq(new_tourist_session_path)
      end
      it 'Tourist情報編集に成功する' do
        login tourist
        visit edit_tourist_tourist_path(tourist.id)
        fill_in 'tourist[email]', with: 'test@example.com'
        fill_in 'tourist[name]', with: 'test'
        fill_in 'tourist[family_name]', with: 'test'
        fill_in 'tourist[birth_year]', with: '1998'
        fill_in 'tourist[nationality]', with: '日本'
        select '男性', from: 'tourist[sex]'
        fill_in 'tourist[postal_code]', with: '123-1234'
        fill_in 'tourist[address]', with: 'Faker::Address.street_address'
        fill_in 'tourist[phone_number]', with: 'Faker::PhoneNumber.cell_phone'
        click_on '情報更新'
        expect(page).to have_content '個人情報を更新しました。'
      end
      it 'メールアドレスを空白にするとTourist情報編集に失敗する' do
        login tourist
        visit edit_tourist_tourist_path(tourist.id)
        fill_in 'tourist[email]', with: ''
        fill_in 'tourist[name]', with: 'test'
        fill_in 'tourist[family_name]', with: 'test'
        fill_in 'tourist[birth_year]', with: '1998'
        fill_in 'tourist[nationality]', with: '日本'
        select '男性', from: 'tourist[sex]'
        fill_in 'tourist[postal_code]', with: '123-1234'
        fill_in 'tourist[address]', with: 'Faker::Address.street_address'
        fill_in 'tourist[phone_number]', with: 'Faker::PhoneNumber.cell_phone'
        click_on '情報更新'
        expect(page).to have_content 'エラー'
      end
    end
  end
end
