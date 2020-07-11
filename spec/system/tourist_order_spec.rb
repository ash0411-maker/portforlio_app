require 'rails_helper'

RSpec.describe 'TouristOrder', type: :system, js: true do
    let!(:tourist) do
        create(:tourist,
            email: 'test@example.com',
            family_name: 'test',
            name: 'test',
            birth_year: 1995,
            nationality: 'test',
            postal_code: 'test',
            address: 'test',
            phone_number: 'test',
            password: '123456',
            password_confirmation: '123456'
            )
    end
    let(:another_tourist) { create(:tourist) }
    let(:guide) { create(:guide) }
    let(:tour) { create(:tour) }
    let(:order) { create(:order) }

    describe '予約テスト' do
        context '予約画面への遷移' do
            it '予約確認画面へ遷移する' do
                login tourist
                visit new_tourist_tourist_order_path(tourist_id: tourist.id, tour_id: tour.id)
                expect(current_path).to eq(new_tourist_tourist_order_path(tourist_id: tourist.id))
            end
            it '個人情報詳細を登録していないので予約確認画面へ遷移せず、個人情報編集ページに遷移する' do
                login another_tourist
                visit new_tourist_tourist_order_path(tourist_id: another_tourist.id, tour_id: tour.id)
                expect(current_path).to eq(edit_tourist_tourist_path(another_tourist.id))
            end
        end

        context '予約人数入力' do
            it '人数を入力したから、予約内容確認画面へ遷移する' do
                login tourist
                visit new_tourist_tourist_order_path(tourist_id: tourist.id, tour_id: tour.id)
                fill_in 'order[total_people]', with: '3'
                click_on '予約内容確認へ'
                expect(current_path).to eq(tourist_tourist_order_confirm_path(tourist))
            end
            it '人数を入力してないから、予約内容確認画面へ遷移しない' do
                login tourist
                visit new_tourist_tourist_order_path(tourist_id: tourist.id, tour_id: tour.id)
                fill_in 'order[total_people]', with: ''
                click_on '予約内容確認へ'
                expect(current_path).to eq(new_tourist_tourist_order_path(tourist_id: tourist.id))
            end
            it '人数を0にすると、予約内容確認画面へ遷移しない' do
                login tourist
                visit new_tourist_tourist_order_path(tourist_id: tourist.id, tour_id: tour.id)
                fill_in 'order[total_people]', with: '0'
                click_on '予約内容確認へ'
                expect(current_path).to eq(new_tourist_tourist_order_path(tourist_id: tourist.id))
            end
        end

        context '予約確認ページ' do
            it 'idが同じだからcurrent_touristの予約一覧ページidへ遷移' do
                login tourist
                visit tourist_tourist_orders_path(tourist.id)
                expect(current_path).to eq(tourist_tourist_orders_path(tourist.id))
            end
            it 'idが異なるから違うユーザーの予約一覧ページに遷移せず、current_touristのtourist詳細ページに遷移' do
                login tourist
                visit tourist_tourist_orders_path(another_tourist.id)
                expect(current_path).to eq(tourist_tourist_path(tourist.id))
            end
        end
    end
end
