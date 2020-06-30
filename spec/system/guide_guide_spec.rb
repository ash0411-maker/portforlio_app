require 'rails_helper'

RSpec.describe 'GuideGuide', type: :system, js: true do
    let(:guide) { create(:guide) }
    let(:another_guide) { create(:guide) }

    describe 'Guide関連ページ' do
        context 'Guide詳細ページ' do
            it 'Guide詳細ページへ遷移する' do
                login guide
                visit guide_guide_path(guide.id)
                expect(current_path).to eq(guide_guide_path(guide.id))
            end
            it 'idが異なるからcurrent_guideの詳細ページへ遷移する' do
                login guide
                visit guide_guide_path(another_guide.id)
                expect(current_path).to eq(guide_guide_path(guide.id))
            end
            it 'ログインなしで詳細ページに遷移しない' do
                visit guide_guide_path(guide.id)
                expect(current_path).to eq(new_guide_session_path)
            end
        end

        context 'Guide編集ページ' do
            it 'Guide編集ページへ遷移する' do
                login guide
                visit edit_guide_guide_path(guide.id)
                expect(current_path).to eq(edit_guide_guide_path(guide.id))
            end
            it 'idが異なるからcurrent_guideの詳細ページへ遷移する' do
                login guide
                visit edit_guide_guide_path(another_guide.id)
                expect(current_path).to eq(guide_guide_path(guide.id))
            end
            it 'ログインなしで編集ページに遷移しない' do
                visit edit_guide_guide_path(guide.id)
                expect(current_path).to eq(new_guide_session_path)
            end
            it 'Guide情報編集に成功する' do
                login guide
                visit edit_guide_guide_path(guide.id)
                fill_in 'guide[email]', with:'test@example.com'
                fill_in 'guide[name]', with:'test'
                fill_in 'guide[family_name]', with:'test'
                fill_in 'guide[introduction]', with:'test'
                fill_in 'guide[nationality]', with:'日本'
                attach_file "guide[identification_image]", "app/assets/images/no_image.jpg"
                attach_file "guide[selfy_image]", "app/assets/images/no_image.jpg"
                fill_in 'guide[postal_code]', with:'123-1234'
                fill_in 'guide[address]', with:'Faker::Address.street_address'
                fill_in 'guide[phone_number]', with:'Faker::PhoneNumber.cell_phone'
                click_on '編集'
                page.driver.browser.switch_to.alert.accept
                expect(current_path).to eq(guide_guide_path(guide))
            end
            it 'メールアドレスを空白にするとGuide情報編集に失敗する' do
                login guide
                visit edit_guide_guide_path(guide.id)
                fill_in 'guide[email]', with:''
                fill_in 'guide[name]', with:'test'
                fill_in 'guide[family_name]', with:'test'
                fill_in 'guide[introduction]', with:'test'
                fill_in 'guide[nationality]', with:'日本'
                attach_file "guide[identification_image]", "app/assets/images/no_image.jpg"
                attach_file "guide[selfy_image]", "app/assets/images/no_image.jpg"
                fill_in 'guide[postal_code]', with:'123-1234'
                fill_in 'guide[address]', with:'Faker::Address.street_address'
                fill_in 'guide[phone_number]', with:'Faker::PhoneNumber.cell_phone'
                click_on '編集'
                page.driver.browser.switch_to.alert.accept
                expect(current_path).to eq(edit_guide_guide_path(guide))
            end
        end
    end
end
