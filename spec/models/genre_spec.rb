require 'rails_helper'


RSpec.describe Genre, type: :model do
	let(:genre) { create(:genre) }


	describe 'Genre保存のテスト' do
        context 'ジャンルが正しく保存される' do
		    it '全て入力されているので保存' do
		        expect(genre).to be_valid
		    end
    	end
    end

    describe 'Genreバリデーションのテスト' do
        context 'titleカラム' do
		    it '空欄でないこと' do
                genre.name = ''
                expect(genre.valid?).to eq false;
		    end
    	end
    end

    describe 'Genreアソシエーションのテスト' do
	  context 'Tourモデルとの関係' do
	    it '1:Nとなっている' do
	        expect(Genre.reflect_on_association(:tours).macro).to eq :has_many
	    end
	  end
	end
end