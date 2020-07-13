require 'rails_helper'

RSpec.describe Contact, type: :model do
	let(:contact) { create(:contact) }

	describe 'Contact保存のテスト' do
        context 'お問い合わせが正しく保存される' do
		    it '全て入力されているので保存' do
		        expect(contact).to be_valid
		    end
    	end
    end


    describe 'Contactバリデーションのテスト' do
        context 'nameカラム' do
		    it '空欄でないこと' do
                contact.name = ''
                expect(contact.valid?).to eq false;
		    end
    	end
    	context 'emailカラム' do
		    it '空欄でないこと' do
                contact.email = ''
                expect(contact.valid?).to eq false;
		    end
    	end
    	context 'user_textカラム' do
		    it '空欄でないこと' do
                contact.user_text = ''
                expect(contact.valid?).to eq false;
            end
    	end
    end

end