# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TourPhoto, type: :model do
  let(:tour) { create(:tour) }
  let!(:tour_photo) { build(:tour_photo, tour_id: tour.id) }

  describe 'TourPhoto保存のテスト' do
    context 'ツアー写真が正しく保存される' do
      it '全て入力されているので保存' do
        expect(tour_photo).to be_valid
      end
    end
  end

  describe 'TourPhotoバリデーションのテスト' do
    context 'image_idカラム' do
      it '空欄でないこと' do
        tour_photo.image_id = ''
        expect(tour_photo.valid?).to eq false
      end
    end
  end

  describe 'TourPhotoアソシエーションのテスト' do
    context 'Tourモデルとの関係' do
      it '1:Nとなっている' do
        expect(TourPhoto.reflect_on_association(:tour).macro).to eq :belongs_to
      end
    end
  end
end
