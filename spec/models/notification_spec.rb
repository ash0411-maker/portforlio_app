require 'rails_helper'


RSpec.describe Notification, type: :model do
	let(:tour) { create(:tour) }
	let(:guide) { create(:guide) }
	let(:tourist) { create(:tourist) }
	let(:review) { create(:review) }
    let!(:notification) { build(:notification, tourist_id: tourist.id, guide_id: guide.id, tour_id: tour.id, review_id: review.id) }

    describe 'Notificaiton保存のテスト' do
        context 'チャットが正しく保存される' do
		    it '全て入力されているので保存' do
		        expect(notification).to be_valid
		    end
    	end
    end

    describe 'notificationバリデーションのテスト' do
        context 'contentカラム' do
		    it '空欄でないこと' do
                notification.guide_id = ''
                expect(notification.valid?).to eq false;
		    end
    	end
    end


    describe 'notificationアソシエーションのテスト' do
        context 'guideモデルとの関係' do
            it 'N:1となっている' do
                expect(Notification.reflect_on_association(:guide).macro).to eq :belongs_to
            end
        end
        context 'touristモデルとの関係' do
            it 'N:1となっている' do
                expect(Notification.reflect_on_association(:tourist).macro).to eq :belongs_to
            end
        end
        context 'tourモデルとの関係' do
            it 'N:1となっている' do
                expect(Notification.reflect_on_association(:tour).macro).to eq :belongs_to
            end
        end
	end

end