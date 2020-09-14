# frozen_string_literal: true

require 'rails_helper'

RSpec.describe News, type: :model do
  describe 'newsアソシエーションのテスト' do
    context 'guideモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:guide).macro).to eq :belongs_to
      end
    end
    context 'touristモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:tourist).macro).to eq :belongs_to
      end
    end
    context 'tourモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:tour).macro).to eq :belongs_to
      end
    end
  end
end
