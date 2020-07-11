require 'rails_helper'

RSpec.describe 'GuideTour', type: :system, js: true do
    let(:tour) { create(:tour) }
    let(:guide) { create(:guide) }
    let(:genre) { create(:genre) }
    let(:city) { create(:city) }
    let(:another_guide) { create(:another_guide) }

    describe 'Tour関連ページ' do
        context 'tour詳細ページ' do
            it 'tour詳細ページへ遷移する' do
                login guide
                visit guide_guide_tour_path(guide, tour.id)
                expect(current_path).to eq(guide_guide_tour_path(guide, tour.id))
            end
            it 'idが異なるので、correct_guideで trueとなる' do
                login another_guide
                visit guide_guide_tour_path(guide, tour.id)
                expect(current_path).to eq(guide_guide_path(another_guide))
            end
            it 'ログインなしではアクセスできない' do
                visit guide_guide_tour_path(guide, tour.id)
                expect(current_path).to eq(new_guide_session_path)
            end
        end

        context 'tour一覧ページ' do
            it 'tour一覧ページへ遷移する' do
                login guide
                visit guide_guide_tours_path(guide, tour.id)
                expect(current_path).to eq(guide_guide_tours_path(guide, tour.id))
            end
            it 'idが異なるので、correct_guideで trueとなる' do
                login another_guide
                visit guide_guide_tours_path(guide, tour.id)
                expect(current_path).to eq(guide_guide_path(another_guide))
            end
            it 'ログインなしではアクセスできない' do
                visit guide_guide_tours_path(guide)
                expect(current_path).to eq(new_guide_session_path)
            end
        end

        context 'tour投稿関連' do
            it '個人情報を入力してるで、tour投稿ページへ遷移' do
                login guide
                visit new_guide_guide_tour_path(guide)
                expect(current_path).to eq(new_guide_guide_tour_path(guide))
            end
            it '個人情報を全項目入力できていないので、編集ページへリンクを持つページへ遷移' do
                login another_guide
                visit new_guide_guide_tour_path(another_guide)
                expect(current_path).to eq(guide_guide_to_guide_edit_path(another_guide))
            end
            it 'idが異なるので、correct_guideで trueとなる' do
                login another_guide
                visit new_guide_guide_tour_path(guide)
                expect(current_path).to eq(guide_guide_path(another_guide))
            end
            it 'ログインなしではアクセスできない' do
                visit new_guide_guide_tour_path(guide)
                expect(current_path).to eq(new_guide_session_path)
            end
            it 'tour投稿に成功する' do
                login guide
                visit new_guide_guide_tour_path(guide)
                fill_in 'tour[title]', with:'test'
                find("#tour_genre_id").find("option[value='1']").select_option
                find("#tour_city_id").find("option[value='1']").select_option
                fill_in 'tour[capacity]', with:'10'
                fill_in 'tour[time]', with:'3日'
                fill_in 'tour[price]', with:'100円'
                fill_in 'tour[contents_of_price]', with:'食費'
                attach_file "tour[tour_photos_attributes][0][image]", "app/assets/images/no_image.jpg"
                fill_in 'tour[meetingpoint_address]', with:Faker::Address.street_address
                fill_in 'tour[meetingpoint_introduction]', with:Faker::Address.street_address
                fill_in 'tour[body]', with:'Faker::PhoneNumber.cell_phone'
                click_on 'ツアー内容を保存'
                expect(page).to have_content '編集'
            end
            it 'tour投稿に失敗する' do
                login guide
                visit new_guide_guide_tour_path(guide)
                fill_in 'tour[title]', with:''
                find("#tour_genre_id").find("option[value='1']").select_option
                find("#tour_city_id").find("option[value='1']").select_option
                fill_in 'tour[capacity]', with:''
                fill_in 'tour[time]', with:''
                fill_in 'tour[price]', with:''
                fill_in 'tour[contents_of_price]', with:''
                attach_file "tour[tour_photos_attributes][0][image]", "app/assets/images/no_image.jpg"
                fill_in 'tour[meetingpoint_address]', with: ''
                fill_in 'tour[meetingpoint_introduction]', with: ''
                fill_in 'tour[body]', with: ''
                click_on 'ツアー内容を保存'
                expect(page).to have_content 'エラー'
            end
        end
    end
end