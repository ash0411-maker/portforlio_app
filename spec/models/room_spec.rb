# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:room) { create(:room) }

  describe 'Genre保存のテスト' do
    context 'ジャンルが正しく保存される' do
      it '全て入力されているので保存' do
        expect(room).to be_valid
      end
    end
  end

  describe 'Roomアソシエーションのテスト' do
    context 'chatモデルとの関係' do
      it '1:Nとなっている' do
        expect(Room.reflect_on_association(:chats).macro).to eq :has_many
      end
    end
    context 'touristモデルとの関係' do
      it 'N:1となっている' do
        expect(Room.reflect_on_association(:tourist).macro).to eq :belongs_to
      end
      context 'guideモデルとの関係' do
        it 'N:1となっている' do
          expect(Room.reflect_on_association(:guide).macro).to eq :belongs_to
        end
      end
    end
  end
end
