require 'rails_helper'


RSpec.describe City, type: :model do
	let(:city) { create(:city) }

	describe 'City保存のテスト' do
        context '都市が正しく保存される' do
		    it '全て入力されているので保存' do
		        expect(city).to be_valid
		    end
    	end
    end

    describe 'Cityバリデーションのテスト' do
        context 'titleカラム' do
		    it '空欄でないこと' do
                city.name = ''
                expect(city.valid?).to eq false;
		    end
    	end
    end

    describe 'Cityアソシエーションのテスト' do
	  context 'Tourモデルとの関係' do
	    it '1:Nとなっている' do
	        expect(City.reflect_on_association(:tours).macro).to eq :has_many
	    end
	  end
	end
end