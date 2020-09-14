# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GuideGuide', type: :system, js: true do
  let(:news) { create(:news) }

  describe 'News' do
    context 'Newsのデータ登録' do
      it 'is valid if title and description fields have value' do
        expect { news }.to change { News.count }.by(1)
      end
    end
  end
end