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
    get 'searches/result'
    get 'contacts/thanks' => 'contacts#thanks', as: 'contact_thanks'
    resources :reviews, only: [:destroy]
    resources :orders, only: %i[index show]
    resources :rooms, only: %i[index show destroy]
    resources :guides, only: %i[show index update destroy]
    resources :tourists, only: %i[show index update destroy]
    resources :tours, only: %i[index show edit update destroy]
    resources :contacts, only: %i[index new create edit update]
    resources :genres, only: %i[index create edit update destroy]
    resources :cities, only: %i[index create edit update destroy]
  end

  namespace :home do
    resources :tours, only: %i[index show]
  end

  namespace :guide do
    get 'guides/thanks' => 'guides#thanks', as: 'thanks'
    resources :guides, only: %i[show edit update destroy] do
      get 'home/top'
      get 'gudies/to_guide_edit' => 'guides#to_guide_edit', as: 'to_guide_edit'
      get 'guides/delete' => 'guides#delete', as: 'guide_delete'
      get 'guides/cannnot_delete' => 'guides#cannot_delete', as: 'cannot_guide_delete'
      resources :tours
      resources :notifications, only: %i[index]
      resources :orders, only: %i[index show update]
      resources :rooms, only: %i[show index create] do
        resources :chats, only: %i[create]
      end
    end
  end

  namespace :tourist do
    get 'orders/thanks' => 'orders#thanks', as: 'orders_thanks'
    get 'tourists/thanks' => 'tourists#thanks', as: 'tourist_thanks'
    resources :tourists, only: %i[edit update destroy] do
      get 'searches/city'
      get 'orders/confirm' => 'orders#confirm', as: 'order_confirm'
      get 'book_marks/index' => 'book_marks#index', as: 'book_marks'
      get 'tourists/delete' => 'tourists#delete', as: 'tourist_delete'
      get 'tourists/cannnot_delete' => 'tourists#cannot_delete', as: 'cannot_tourist_delete'
      resources :chat_notices, only: %i[index]
      resources :orders, only: %i[show index new create destroy]
      resources :tours, only: %i[index show] do
        resource :book_marks, only: %i[create destroy]
        resources :reviews, only: %i[create update]
      end
      resources :rooms, only: %i[show index create] do
        resources :chats, only: %i[create]
      end
    end
  end
end
