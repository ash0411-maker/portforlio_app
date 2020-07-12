# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:tour) { create(:tour) }
  let(:guide) { create(:guide) }
  let(:tourist) { create(:tourist) }
  let!(:order) { build(:order, guide_id: guide.id, tourist_id: tourist.id, tour_id: tour.id) }

  describe 'Order保存のテスト' do
    context 'ツアーが正しく保存される' do
      it '全て入力されているので保存' do
        expect(order).to be_valid
      end
    end
  end

  describe 'Orderバリデーションのテスト' do
    context 'total_peopleカラム' do
      it '空欄でないこと' do
        order.total_people = ''
        expect(order.valid?).to eq false
      end
    end
  end

  describe 'Orderアソシエーションのテスト' do
    context 'Guideモデルとの関係' do
      it 'N:1となっている' do
        expect(Order.reflect_on_association(:guide).macro).to eq :belongs_to
      end
    end
    context 'Touristモデルとの関係' do
      it 'N:1となっている' do
        expect(Order.reflect_on_association(:tourist).macro).to eq :belongs_to
      end
    end
  end
end
