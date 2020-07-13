require 'rails_helper'


RSpec.describe Review, type: :model do
	let(:tourist) { create(:tourist) }
    let(:tour) { create(:tour) }
    let!(:review) { build(:review, tourist_id: tourist.id, tour_id: tour.id) }



    describe 'review保存のテスト' do
        context 'レビューコメントが正しく保存される' do
		    it '全て入力されているので保存' do
		        expect(review).to be_valid
		    end
    	end
    end



    describe 'reviewバリデーションのテスト' do
        context 'commentカラム' do
		    it '空欄でないこと' do
                review.comment = ''
                expect(review.valid?).to eq false;
		    end
		    it '400文字以下であること' do
                review.comment = Faker::Lorem.characters(number:401)
                expect(review.valid?).to eq false;
		    end
    	end
    end


    describe 'reviewアソシエーションのテスト' do
	  context 'Tourモデルとの関係' do
	    it 'N:1となっている' do
	        expect(Review.reflect_on_association(:tour).macro).to eq :belongs_to
	    end
	  end
	  context 'Touristモデルとの関係' do
	    it 'N:1となっている' do
	        expect(Review.reflect_on_association(:tourist).macro).to eq :belongs_to
	    end
	  end
	end
end