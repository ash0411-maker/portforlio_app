# frozen_string_literal: true

Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions: 'devise/admins/sessions',
    passwords: 'devise/admins/passwords',
    registrations: 'devise/admins/registrations'
  }

  # 管理者ゲストログイン
  devise_scope :admin do
    post 'admins/sign_in_with_guest' => 'devise/admins/sessions#admin_guest', as: 'guest_admin'
  end

  namespace :admin do
    get 'home/top'
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :cities, only: [:index, :create, :edit, :update, :destroy]
  end

end
