require 'rails_helper'

RSpec.describe 'TouristTour', type: :system, js: true do
    let(:another_tourist) { create(:tourist) }
    let(:tourist) { create(:tourist) }
    let(:tour) { create(:guide) }


    describe 'Tour関連ページ' do
        context 'Tour詳細ページ' do
            it 'Tour詳細ページへ遷移する' do
                login tourist
                visit tourist_tourist_tour_path(tourist.id, tour.id)
                expect(current_path).to eq(tourist_tourist_tour_path(tourist.id, tour.id))
            end
            it 'tourist.idが異なるのでTour詳細ページへ遷移しない' do
                login another_tourist
                visit tourist_tourist_tour_path(tourist.id, tour.id)
                expect(current_path).to eq(tourist_tourist_path(another_tourist.id))
            end
            it 'ログイン無しではTour詳細ページへ遷移せず、ログイン画面へ遷移する' do
                visit tourist_tourist_tour_path(tourist.id, tour.id)
                expect(current_path).to eq(new_tourist_session_path)
            end
        end


        context 'Tour詳細ページ' do
            it 'Tour一覧ページへ遷移する' do
                login tourist
                visit tourist_tourist_tours_path(tourist.id)
                expect(current_path).to eq(tourist_tourist_tours_path(tourist_id: tourist.id))
            end
            it 'Tour一覧ページへ遷移しない' do
                login tourist
                visit tourist_tourist_tours_path(another_tourist.id)
                expect(current_path).to eq(tourist_tourist_path(tourist.id))
            end
        end
    end
end