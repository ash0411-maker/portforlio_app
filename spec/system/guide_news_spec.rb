# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GuideGuide', type: :system, js: true do
  let(:news) { create(:news) }
  let(:another_news) { News.create(tour_id: 1, guide_id: 1, action: "") }

  describe 'News' do
    context 'Newsのデータ登録' do
      it 'データの登録に成功する' do
        expect { news }.to change { News.count }.by(1)
      end
      it 'データの登録に失敗する' do
        expect { another_news }.to change { News.count }.by(0)
      end
    end
  end
end