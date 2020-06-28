require 'rails_helper'

RSpec.describe 'Guide', type: :request do
  let!(:guide) { create(:guide) }
  let!(:another_guide) { create(:guide) }

  describe 'ログイン' do
    context '未ログイン状態のとき' do
      it 'アクセス拒否' do
        get  edit_guide_guide_path(guide)
        expect(response).to have_http_status 403
      end
    end
  end
end