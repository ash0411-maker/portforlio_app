# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Guide, type: :model do
  let(:guide) { create(:guide) }

  describe 'Guide保存のテスト' do
    context 'ガイドが正しく保存される' do
      it '全て入力されているので保存' do
        expect(guide).to be_valid
      end
    end
  end

  describe 'Guideバリデーションのテスト' do
    context 'introductionカラム' do
      it '400文字以下であること' do
        guide.introduction = Faker::Lorem.characters(number: 401)
        expect(guide.valid?).to eq false
      end
    end
  end

  describe 'Guideアソシエーションのテスト' do
    context 'Tourモデルとの関係' do
      it '1:Nとなっている' do
        expect(Guide.reflect_on_association(:tours).macro).to eq :has_many
      end
    end
    context 'Orderモデルとの関係' do
      it '1:Nとなっている' do
        expect(Guide.reflect_on_association(:orders).macro).to eq :has_many
      end
    end
    context 'Roomモデルとの関係' do
      it '1:Nとなっている' do
        expect(Guide.reflect_on_association(:rooms).macro).to eq :has_many
      end
    end
    context 'Notificationモデルとの関係' do
      it '1:Nとなっている' do
        expect(Guide.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
    context 'GuideActiveNoticesモデルとの関係' do
      it '1:Nとなっている' do
        expect(Guide.reflect_on_association(:guide_active_notices).macro).to eq :has_many
      end
    end
    context 'GuidePassiveNoticesモデルとの関係' do
      it '1:Nとなっている' do
        expect(Guide.reflect_on_association(:guide_passive_notices).macro).to eq :has_many
      end
    end
  end
end
