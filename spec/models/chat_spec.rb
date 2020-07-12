# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chat, type: :model do
  let(:room) { create(:room) }
  let!(:chat) { build(:chat, room_id: room.id) }

  describe 'chat保存のテスト' do
    context 'チャットが正しく保存される' do
      it '全て入力されているので保存' do
        expect(chat).to be_valid
      end
    end
  end

  describe 'chatバリデーションのテスト' do
    context 'contentカラム' do
      it '空欄でないこと' do
        chat.message = ''
        expect(chat.valid?).to eq false
      end
    end
  end

  describe 'chatアソシエーションのテスト' do
    context 'ChatNoticeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Chat.reflect_on_association(:chat_notices).macro).to eq :has_many
      end
    end
    context 'Roomモデルとの関係' do
      it 'N:1となっている' do
        expect(Chat.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
  end
end
