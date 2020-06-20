# frozen_string_literal: true

Rails.application.routes.draw do

  namespace :tourist do
    get 'orders/index'
    get 'orders/new'
  end
  root to: 'home/tours#index'

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

  devise_for :tourists, controllers: {
    sessions: 'devise/tourists/sessions',
    passwords: 'devise/tourists/passwords',
    registrations: 'devise/tourists/registrations'
  }

  # 管理者ゲストログイン
  devise_scope :admin do
    post 'admins/sign_in_with_guest' => 'devise/admins/sessions#admin_guest', as: 'guest_admin'
  end

  # ガイドゲストログイン
  devise_scope :guide do
    post 'guides/sign_in_with_guest' => 'devise/guides/sessions#guide_guest', as: 'guest_guide'
  end

  # ツーリストゲストログイン
  devise_scope :guide do
    post 'tourists/sign_in_with_guest' => 'devise/tourists/sessions#tourist_guest', as: 'guest_tourist'
  end

  namespace :admin do
    get 'home/top'
    resources :tours, only: %i[index show edit update destroy]
    resources :genres, only: %i[index create edit update destroy]
    resources :cities, only: %i[index create edit update destroy]
  end

  namespace :home do
    resources :tours, only: %i[index show]
  end

  namespace :guide do
    get 'home/top'
    resources :tours
  end

  namespace :tourist do
    get 'searches/city'
    resources :tours, only: %i[index show] do
      resource :book_marks, only: %i[create destroy]
    end
  end
end
