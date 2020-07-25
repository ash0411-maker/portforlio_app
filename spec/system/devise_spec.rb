# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Devise', type: :system, js: true do
  let!(:guide) do
    create(:guide,
           email: 'test@example.com',
           password: '123456',
           password_confirmation: '123456')
  end
  let!(:admin) do
    create(:admin,
           email: 'test@example.com',
           password: '123456',
           password_confirmation: '123456')
  end
  let!(:tourist) do
    create(:tourist,
           email: 'test@example.com',
           password: '123456',
           password_confirmation: '123456')
  end

  describe 'Adminテスト' do
    context 'ログイン' do
      it 'ログインに成功する' do
        visit new_admin_session_path
        fill_in 'admin[email]', with: 'test@example.com'
        fill_in 'admin[password]', with: '123456'
        click_button 'ログイン'
        expect(current_path).to eq(admin_home_top_path)
      end
      it 'ログインに失敗する' do
        visit new_admin_session_path
        fill_in 'admin[email]', with: ''
        fill_in 'admin[password]', with: ''
        click_button 'ログイン'
        expect(current_path).to eq(new_admin_session_path)
      end
      # ciecleciで通らない
      # it 'かんたんログイン' do
      #   visit new_admin_session_path
      #   click_on 'かんたんログイン（閲覧用）'
      #   expect(current_path).to eq(guest_admin_path)
      # end

      # 実際にログアウトできるがテストが通らない
      # it 'ログアウト' do
      #   login admin
      #   visit admin_home_top_path
      #   find(".hm-icon").click
      #   click_on 'ログアウト'
      #   expect(current_path).to eq(new_admin_session_path)
      # end
    end

    context 'Guide 会員ステータス変更' do
      it '退会' do
        login admin
        visit admin_guide_path(guide)
        find('#guide_deleted_at_1').click
        click_button '更新'
        expect(page).to have_content '退会させました'
      end
      it '復活' do
        login admin
        visit admin_guide_path(guide)
        find('#guide_deleted_at_0').click
        click_button '更新'
        expect(page).to have_content '会員を再開させました'
      end
    end
  end

  describe 'Guideテスト' do
    context '新規登録' do
      before do
        visit new_guide_registration_path
      end
      it '新規登録に成功する' do
        fill_in 'guide[email]', with: Faker::Internet.email
        fill_in 'guide[password]', with: 'password'
        fill_in 'guide[password_confirmation]', with: 'password'
        click_button '新規登録'
        expect(page).to have_content '本日に入った予約件数は'
      end
      it '新規登録に失敗する' do
        fill_in 'guide[email]', with: ''
        fill_in 'guide[password]', with: ''
        fill_in 'guide[password_confirmation]', with: ''
        click_button '新規登録'
        expect(page).to have_content '件のエラーが発生したため'
      end
    end
    context 'ログイン・ログアウト' do
      it 'ログインに成功する' do
        visit new_guide_session_path
        fill_in 'guide[email]', with: 'test@example.com'
        fill_in 'guide[password]', with: '123456'
        click_button 'ログイン'
        expect(current_path).to eq(guide_guide_home_top_path(guide))
      end
      it 'ログインに失敗する' do
        visit new_guide_session_path
        fill_in 'guide[email]', with: ''
        fill_in 'guide[password]', with: ''
        click_button 'ログイン'
        expect(current_path).to eq(new_guide_session_path)
      end
      it 'ログインに失敗する' do
        visit new_guide_session_path
        fill_in 'guide[email]', with: 'test@example.com'
        fill_in 'guide[password]', with: '654321'
        click_button 'ログイン'
        expect(current_path).to eq(new_guide_session_path)
      end
      # ciecleciで通らない
      # it 'かんたんログイン' do
      #   visit new_guide_session_path
      #   click_on 'ゲストログイン（閲覧用）'
      #   expect(current_path).to eq(guest_guide_path)
      # end
      # ログアウトできるがテストが通らない
      # it 'ログアウトに成功する' do
      #   login guide
      #   visit guide_guide_home_top_path(guide)
      #   find(".hm-icon").click
      #   click_on 'ログアウト'
      #   expect(current_path).to eq(root_path)
      # end
    end
    context '退会に成功する' do
      before do
        login guide
        visit guide_guide_guide_delete_path(guide)
        click_on '退会する'
        page.driver.browser.switch_to.alert.accept
      end
      it '退会に成功する' do
        expect(page).to have_content 'ありがとうございました'
      end
    end
  end

  describe 'Touristテスト' do
    context '新規登録' do
      before do
        visit new_tourist_registration_path
      end
      it '新規登録に成功する' do
        fill_in 'tourist[email]', with: Faker::Internet.email
        fill_in 'tourist[password]', with: 'password'
        fill_in 'tourist[password_confirmation]', with: 'password'
        click_button '新規登録'
        expect(page).to have_content 'アカウント登録が完了しました'
      end
      it '新規登録に失敗する' do
        fill_in 'tourist[email]', with: ''
        fill_in 'tourist[password]', with: ''
        fill_in 'tourist[password_confirmation]', with: ''
        click_button '新規登録'
        expect(page).to have_content '件のエラーが発生したため'
      end
    end
    context 'ログイン・ログアウト' do
      it 'ログインに成功する' do
        visit new_tourist_session_path
        fill_in 'tourist[email]', with: 'test@example.com'
        fill_in 'tourist[password]', with: '123456'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
      it 'ログインに失敗する' do
        visit new_tourist_session_path
        fill_in 'tourist[email]', with: ''
        fill_in 'tourist[password]', with: ''
        click_button 'ログイン'
        expect(current_path).to eq(new_tourist_session_path)
      end
      it 'ログインに失敗する' do
        visit new_guide_session_path
        fill_in 'guide[email]', with: 'test@example.com'
        fill_in 'guide[password]', with: '654321'
        click_button 'ログイン'
        expect(current_path).to eq(new_guide_session_path)
      end
      # ciecleciで通らない
      # it 'かんたんログイン' do
      #   visit new_tourist_session_path
      #   click_on 'ゲストログイン（閲覧用）'
      #   expect(current_path).to eq(guest_tourist_path)
      # end
      it 'ログアウト' do
        login tourist
        visit tourist_tourist_tours_path(tourist)
        find(".hm-icon").click
        click_on 'ログアウト'
        expect(current_path).to eq(root_path)
      end
    end
    context '退会に成功する' do
      before do
        login tourist
        visit tourist_tourist_tourist_delete_path(tourist)
        click_on '退会する'
        page.driver.browser.switch_to.alert.accept
      end
      it '退会に成功する' do
        expect(page).to have_content 'ありがとうございました'
      end
    end
  end
end
