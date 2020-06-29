require 'rails_helper'



RSpec.describe Guide::GuidesController, type: :system do
  let(:guide) { create(:guide) }

  describe 'Guide新規登録' do
    before do
        visit new_guide_registration_path
    end


    context '新規登録画面' do
        it '新規登録に成功する' do
            fill_in 'メールアドレス', with: Faker::Internet.email
            fill_in 'パスワード', with: 'password'
            fill_in '確認用パスワード', with: 'password'
            click_button '新規登録'

            expect(page).to have_content '本日に入った予約件数は'
        end
    end
  end
end