# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'touristTour', type: :system, js: true do
  let(:tour) { create(:tour) }
  let(:room) { create(:room) }
  let(:tourist) { create(:tourist) }
  let(:another_tourist) { create(:tourist) }

  describe 'チャットルーム関連' do
    context 'チャットルームページ' do
      it 'tour一覧ページへ遷移する' do
        login tourist
        visit tourist_tourist_rooms_path(tourist)
        expect(current_path).to eq(tourist_tourist_rooms_path(tourist))
      end
      it 'idが異なるので、correct_touristで trueとなる' do
        login another_tourist
        visit tourist_tourist_rooms_path(tourist)
        expect(current_path).to eq(tourist_tourist_path(another_tourist))
      end
      it 'ログインなしではアクセスできない' do
        visit tourist_tourist_rooms_path(tourist)
        expect(current_path).to eq(new_tourist_session_path)
      end
      it 'tour一覧ページへ遷移する' do
        login tourist
        visit tourist_tourist_tour_path(tourist, tour)
        click_on '質問しましょう！'
        expect(page).to have_content 'まだメッセージはありません'
      end
      it 'ログインなしではアクセスできない' do
        visit tourist_tourist_room_path(tourist, room)
        expect(current_path).to eq(new_tourist_session_path)
      end
    end

    context 'tour投稿関連' do
      before do
        login tourist
        visit tourist_tourist_tour_path(tourist, tour)
        click_on '質問しましょう！'
      end
      it 'チャットメッセージ投稿に成功する' do
        fill_in 'chat[message]', with: 'test'
        click_on 'メッセージを送る'
        expect(page).to have_content 'test'
      end
      it 'チャットメッセージ投稿に失敗する' do
        fill_in 'chat[message]', with: ''
        click_on 'メッセージを送る'
        expect(page).to have_content 'メッセージを入力してください'
      end
    end
  end
end
