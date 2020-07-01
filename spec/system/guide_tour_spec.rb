require 'rails_helper'

RSpec.describe 'GuideTour', type: :system, js: true do
    let(:tour) { create(:tour) }
    let(:another_guide) { create(:guide) }
    let(:guide) { create(:guide) }
    let!(:genre) do
        create(:genre,
            name: 'test',
            )
    end

    describe 'Tour関連ページ' do
        # context 'tour詳細ページ' do
        #     it 'tour詳細ページへ遷移する' do
        #         login guide
        #         visit guide_guide_tour_path(guide, tour.id)
        #         expect(current_path).to eq(guide_guide_tour_path(guide, tour.id))
        #     end
        #     it 'idが異なるので、correct_guideで trueとなる' do
        #         login another_guide
        #         visit guide_guide_tour_path(guide, tour.id)
        #         expect(current_path).to eq(guide_guide_path(another_guide))
        #     end
        #     it 'ログインなしではアクセスできない' do
        #         visit guide_guide_tour_path(guide, tour.id)
        #         expect(current_path).to eq(new_guide_session_path)
        #     end
        # end

        # context 'tour一覧ページ' do
        #     it 'tour一覧ページへ遷移する' do
        #         login guide
        #         visit guide_guide_tours_path(guide, tour.id)
        #         expect(current_path).to eq(guide_guide_tours_path(guide, tour.id))
        #     end
        #     it 'idが異なるので、correct_guideで trueとなる' do
        #         login another_guide
        #         visit guide_guide_tours_path(guide, tour.id)
        #         expect(current_path).to eq(guide_guide_path(another_guide))
        #     end
        #     it 'ログインなしではアクセスできない' do
        #         visit guide_guide_tours_path(guide)
        #         expect(current_path).to eq(new_guide_session_path)
        #     end
        # end

        context 'tour投稿関連' do
            it '個人情報を入力できていないので、編集ページへリンクを持つページへ遷移' do
                login guide
                visit new_guide_guide_tour_path(guide)
                expect(current_path).to eq(guide_guide_to_guide_edit_path(guide))
            end
            # it 'idが異なるので、correct_guideで trueとなる' do
            #     login another_guide
            #     visit new_guide_guide_tour_path(guide)
            #     expect(current_path).to eq(guide_guide_path(another_guide))
            # end
            # it 'ログインなしではアクセスできない' do
            #     visit new_guide_guide_tour_path(guide)
            #     expect(current_path).to eq(new_guide_session_path)
            # end
            # it 'tour投稿に成功する' do
            #     login guide
            #     visit new_guide_guide_tour_path(guide)
            #     fill_in 'tour[title]', with:'test'
            #     fill_in 'tour[name]', with:'test'
            #     select 'genre', from: 'tour[genre]'
            #     fill_in 'tour[capacity]', with:'10'
            #     fill_in 'tour[time]', with:'3日'
            #     fill_in 'tour[price]', with:'100円'
            #     attach_file "tour[tour_photos_attributes][0][image]", "app/assets/images/no_image.jpg"
            #     fill_in 'tour[meetingpoint_address]', with:'京都府'
            #     fill_in 'tour[meetingpoint_introduction]', with:'Faker::Address.street_address'
            #     fill_in 'tour[body]', with:'Faker::PhoneNumber.cell_phone'
            #     click_on 'ツアー内容を保存'
            #     expect(page).to have_content '編集'
            # end
        end
    end
end