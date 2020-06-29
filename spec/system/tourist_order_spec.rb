require 'rails_helper'

RSpec.describe 'Tourist', type: :system do
    let(:tourist) { create(:tourist) }
    let(:another_tourist) { create(:another_tourist) }
    let(:order) { create(:order) }



    describe '予約テスト' do
        context '予約人数入力' do
            before do
                login tourist
                visit new_tourist_tourist_order_path(tourist)
                take_screenshot
            end
            it '予約確認画面へ遷移する' do
                fill_in 'order_total_peole', with: '3'
                click_on '予約内容確認へ'
                expect(current_path).to eq(tourist_tourist_order_confirm_path(tourist))
            end
        end
    end
end

