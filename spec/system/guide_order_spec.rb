# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GuideOrder', type: :system, js: true do
  let(:order) { create(:order_a) }
  let(:guide) { create(:guide) }
  let(:tour) { create(:tour) }
  let(:another_guide) { create(:another_guide) }

  describe '予約関連ページ' do
    context '予約一覧ページ' do
      it '予約一覧ページへ遷移する' do
        login guide
        visit guide_guide_orders_path(guide.id)
        expect(current_path).to eq(guide_guide_orders_path(guide.id))
      end
      it 'idが異なるからcurrent_guideの詳細ページへ遷移する' do
        login guide
        visit guide_guide_orders_path(another_guide.id)
        expect(current_path).to eq(guide_guide_path(guide.id))
      end
      it 'ログインなしで予約一覧ページに遷移しない' do
        visit guide_guide_orders_path(guide.id)
        expect(current_path).to eq(new_guide_session_path)
      end
    end

    context '予約ステータス編集ページ' do
      it '新規予約確認ページへ遷移する' do
        login guide
        visit guide_guide_new_order_path(guide.id)
        expect(current_path).to eq(guide_guide_new_order_path(guide.id))
      end
      it 'idが異なるからcurrent_guide詳細ページへ遷移する' do
        login guide
        visit guide_guide_new_order_path(another_guide.id)
        expect(current_path).to eq(guide_guide_path(guide.id))
      end
      it 'ログインなしで新規予約確認ページに遷移しない' do
        visit guide_guide_new_order_path(guide.id)
        expect(current_path).to eq(new_guide_session_path)
      end
      it 'ツアー前日・当日ページへ遷移する' do
        login guide
        visit guide_guide_day_before_touring_path(guide.id)
        expect(current_path).to eq(guide_guide_day_before_touring_path(guide.id))
      end
      it 'idが異なるからcurrent_guide詳細ページへ遷移する' do
        login guide
        visit guide_guide_day_before_touring_path(another_guide.id)
        expect(current_path).to eq(guide_guide_path(guide.id))
      end
      it 'ログインなしでツアー前日・当日ページに遷移しない' do
        visit guide_guide_day_before_touring_path(guide.id)
        expect(current_path).to eq(new_guide_session_path)
      end
      it 'ツアー終了ページへ遷移する' do
        login guide
        visit guide_guide_finished_tour_path(guide.id)
        expect(current_path).to eq(guide_guide_finished_tour_path(guide.id))
      end
      it 'idが異なるからcurrent_guide詳細ページへ遷移する' do
        login guide
        visit guide_guide_finished_tour_path(another_guide.id)
        expect(current_path).to eq(guide_guide_path(guide.id))
      end
      it 'ログインなしでツアー終了ページに遷移しない' do
        visit guide_guide_finished_tour_path(guide.id)
        expect(current_path).to eq(new_guide_session_path)
      end
    end
  end
end
