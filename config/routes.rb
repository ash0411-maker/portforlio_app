# frozen_string_literal: true

Rails.application.routes.draw do

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
    resources :guides, only: %i[show edit update destroy] do
      get 'home/top'
      get 'orders/new_order' => 'orders#new_order', as: 'new_order'
      get 'orders/finished_tour' => 'orders#finished_tour', as: 'finished_tour'
      get 'orders/day_before_touring' => 'orders#day_before_touring', as: 'day_before_touring'
      get 'gudies/to_guide_edit' => 'guides#to_guide_edit', as: 'to_guide_edit'
      resources :tours
      resources :orders, only: %i[index update]
    end
  end


  namespace :tourist do
    get 'orders/thanks' => 'orders#thanks', as: 'orders_thanks'
    resources :tourists, only: %i[show edit update destroy] do
      get 'searches/city'
      get 'orders/confirm' => 'orders#confirm', as: 'order_confirm'
      get 'book_marks/index' => 'book_marks#index', as: 'book_marks'
      resources :orders, only: %i[show index new create destroy]
      resources :tours, only: %i[index show] do
        resource :book_marks, only: %i[create destroy]
      end
    end
  end
end
