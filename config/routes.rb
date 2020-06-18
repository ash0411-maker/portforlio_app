# frozen_string_literal: true


Rails.application.routes.draw do

  devise_for :tourists
  devise_for :admins, controllers: {
    sessions: 'devise/admins/sessions',
    passwords: 'devise/admins/passwords',
    registrations: 'devise/admins/registrations'
  }

  devise_for :guides, controllers: {
    sessions: 'devise/guides/sessions',
    passwords: 'devise/guides/passwords',
    registrations: 'devise/guides/registrations'
  }

  # 管理者ゲストログイン
  devise_scope :admin do
    post 'admins/sign_in_with_guest' => 'devise/admins/sessions#admin_guest', as: 'guest_admin'
  end

  # ガイドゲストログイン
  devise_scope :guide do
    post 'guides/sign_in_with_guest' => 'devise/guides/sessions#guide_guest', as: 'guest_guide'
  end

  namespace :admin do
    get 'home/top'
  end

  namespace :guide do
    get 'home/top'
  end
end
