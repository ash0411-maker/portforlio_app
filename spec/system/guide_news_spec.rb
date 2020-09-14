# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GuideGuide', type: :system, js: true do
  let(:news) { create(:news) }

  describe 'News' do
    context 'Newsのデータ登録' do
      it 'データの登録に成功する' do
        expect { news }.to change { News.count }.by(1)
      end
    end
  end
end