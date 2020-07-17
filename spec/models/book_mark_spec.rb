# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookMark, type: :model do
  let(:tourist) { create(:tourist) }
  let(:tour) { create(:tour) }
  let!(:book_mark) { build(:book_mark, tour_id: tour.id, tourist_id: tourist.id) }

  describe 'BookMark保存のテスト' do
    context 'ブックマークのデータが正しく保存される' do
      it '全て入力してあるので保存される' do
        expect(book_mark).to be_valid
      end
    end
  end

  describe 'BookMarkアソシエーションのテスト' do
    context 'Tourモデルとの関係' do
      it 'N:1となっている' do
        expect(BookMark.reflect_on_association(:tourist).macro).to eq :belongs_to
      end
    end
    context 'BookMarkモデルとの関係' do
      it 'N:1となっている' do
        expect(BookMark.reflect_on_association(:tour).macro).to eq :belongs_to
      end
    end
  end
end
