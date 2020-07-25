# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GuideOrder', type: :system, js: true do
  let(:order) { create(:order) }
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

    context '予約詳細ページ' do
      it 'idが異なるからcurrent_guide詳細ページへ遷移する' do
        login guide
        visit guide_guide_order_path(another_guide.id, order.id)
        expect(current_path).to eq(guide_guide_path(guide.id))
      end
      it 'ログイン無しで遷移しない' do
        visit guide_guide_order_path(another_guide.id, order.id)
        expect(current_path).to eq(new_guide_session_path)
      end
    end
  end
end


