# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tourist, type: :model do
  let(:tourist) { create(:tourist) }

  describe 'Tourist保存のテスト' do
    context 'ガイドが正しく保存される' do
      it '全て入力されているので保存' do
        expect(tourist).to be_valid
      end
    end
  end

  describe 'Touristアソシエーションのテスト' do
    context 'Orderモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tourist.reflect_on_association(:orders).macro).to eq :has_many
      end
    end
    context 'Roomモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tourist.reflect_on_association(:rooms).macro).to eq :has_many
      end
    end
    context 'BookMarkモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tourist.reflect_on_association(:book_marks).macro).to eq :has_many
      end
    end
    context 'Reviewモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tourist.reflect_on_association(:reviews).macro).to eq :has_many
      end
    end
    context 'Tourist_active_noticeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tourist.reflect_on_association(:tourist_active_notices).macro).to eq :has_many
      end
    end
    context 'Tourist_passive_noticeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tourist.reflect_on_association(:tourist_passive_notices).macro).to eq :has_many
      end
    end
  end
end
