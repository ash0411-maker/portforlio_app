require 'rails_helper'



RSpec.describe Guide::GuidesController, type: :system do
    let!(:guide) do
        create(:guide,
               email: 'test@example.com',
               password: '123456',
               password_confirmation: '123456'
            )
    end

  describe 'Devise_Guideテスト' do
    context '新規登録' do
        before do
            visit new_guide_registration_path
        end
        it '新規登録に成功する' do
            fill_in 'guide[email]', with: Faker::Internet.email
            fill_in 'guide[password]', with: 'password'
            fill_in 'guide[password_confirmation]', with: 'password'
            click_button '新規登録'
            expect(page).to have_content '本日に入った予約件数は'
        end
        it '新規登録に失敗する' do
            fill_in 'guide[email]', with: ''
            fill_in 'guide[password]', with: ''
            fill_in 'guide[password_confirmation]', with: ''
            click_button '新規登録'
            expect(page).to have_content 'error'
        end
    end

    context 'ログイン' do
        before do
            visit new_guide_session_path
        end
        it 'ログインに成功する' do
            fill_in 'guide[email]', with:'test@example.com'
            fill_in 'guide[password]', with: '123456'
            click_button 'ログイン'
            expect(current_path).to eq(guide_guide_home_top_path(guide))
        end
        it 'ログインに失敗する' do
            fill_in 'guide[email]', with: ''
            fill_in 'guide[password]', with: ''
            click_button 'ログイン'
            expect(current_path).to eq(new_guide_session_path)
        end
    end

    context 'ログアウト' do
        before do
            login guide
            click_on 'ログアウト'
        end
        it 'ログアウトに成功する' do
            expect(current_path).to eq(home_tours_path)
        end
    end
  end
end

