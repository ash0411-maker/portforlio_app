require 'rails_helper'

RSpec.describe 'Adminroom', type: :system, js: true do
    let(:admin) { create(:admin) }
    let(:room) { create(:room) }

    describe 'チャットルーム関連ページ' do
        context 'room詳細ページ' do
            it 'room詳細ページへ遷移する' do
                login admin
                visit admin_room_path(room)
                expect(current_path).to eq(admin_room_path(room))
            end
            it 'ログインなしで詳細ページに遷移しない' do
                visit admin_room_path(room)
                expect(current_path).to eq(new_admin_session_path)
            end
        end

        context 'room一覧ページ' do
            it 'room一覧ページへ遷移する' do
                login admin
                visit admin_rooms_path
                expect(current_path).to eq(admin_rooms_path)
            end
            it 'ログインなしで詳細ページに遷移しない' do
                visit admin_rooms_path
                expect(current_path).to eq(new_admin_session_path)
            end
        end

        context 'チャット削除' do
            it '削除に成功する' do
                login admin
                visit admin_room_path(room)
                click_on 'チャットルームを削除'
                page.driver.browser.switch_to.alert.accept
                expect(page).to have_content 'チャットルームを削除しました。'
            end
        end
    end
end
