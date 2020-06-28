require 'rails_helper'


RSpec.describe Tour, type: :model do
	let(:guide) { create(:guide) }
	let(:genre) { create(:genre) }
	let(:city) { create(:city) }
	let!(:tour) { build(:tour, guide_id: guide.id, city_id: city.id,genre_id: genre.id) }



	describe 'Tour保存のテスト' do
        context 'ツアーが正しく保存される' do
		    it '全て入力されているので保存' do
		        expect(tour).to be_valid
		    end
    	end
    end


    describe 'Tourバリデーションのテスト' do
    	context 'titleカラム' do
		    it '20文字以内であること' do
                tour.title = Faker::Lorem.characters(number:21)
                expect(tour.valid?).to eq false;
		    end
		    it '空欄でないこと' do
                tour.title = ''
                expect(tour.valid?).to eq false;
		    end
    	end
    	context 'bodyカラム' do
		    it '800文字以内であること' do
                tour.body = Faker::Lorem.characters(number:801)
                expect(tour.valid?).to eq false;
		    end
		    it '空欄でないこと' do
                tour.body = ''
                expect(tour.valid?).to eq false;
		    end
    	end
    	context 'meetingpoint_introductionカラム' do
		    it '400文字以内であること' do
                tour.meetingpoint_introduction = Faker::Lorem.characters(number:401)
                expect(tour.valid?).to eq false;
		    end
		    it '空欄でないこと' do
                tour.meetingpoint_introduction = ''
                expect(tour.valid?).to eq false;
		    end
    	end
    	context 'meetingpoint_addressカラム' do
		    it '空欄でないこと' do
                tour.meetingpoint_address = ''
                expect(tour.valid?).to eq false;
		    end
    	end
    	context 'priceカラム' do
		    it '空欄でないこと' do
                tour.price = ''
                expect(tour.valid?).to eq false;
		    end
    	end
    	context 'contents_of_priceカラム' do
		    it '空欄でないこと' do
                tour.contents_of_price = ''
                expect(tour.valid?).to eq false;
		    end
    	end
    	context 'timeカラム' do
		    it '空欄でないこと' do
                tour.time = ''
                expect(tour.valid?).to eq false;
		    end
    	end
    end



    describe 'Tourアソシエーションのテスト' do
    	context 'Guideモデルとの関係' do
            it '1:Nとなっている' do
                expect(Tour.reflect_on_association(:guide).macro).to eq :belongs_to
            end
		end
		context 'Genreモデルとの関係' do
            it '1:Nとなっている' do
                expect(Tour.reflect_on_association(:genre).macro).to eq :belongs_to
            end
		end
		context 'Guideモデルとの関係' do
            it '1:Nとなっている' do
                expect(Tour.reflect_on_association(:city).macro).to eq :belongs_to
            end
		end
		context 'BookMarkモデルとの関係' do
            it '1:Nとなっている' do
                expect(Tour.reflect_on_association(:book_marks).macro).to eq :has_many
            end
		end
		context 'Tourphotoモデルとの関係' do
            it '1:Nとなっている' do
                expect(Tour.reflect_on_association(:tour_photos).macro).to eq :has_many
            end
		end
		context 'Reviewモデルとの関係' do
            it '1:Nとなっている' do
                expect(Tour.reflect_on_association(:reviews).macro).to eq :has_many
            end
		end
		context 'Notificationモデルとの関係' do
            it '1:Nとなっている' do
                expect(Tour.reflect_on_association(:notifications).macro).to eq :has_many
            end
		end
	end
end
