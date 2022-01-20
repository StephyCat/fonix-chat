Rails.application.routes.draw do
  devise_scope :user do
    get 'profile/edit'    => 'devise/registrations#edit',   as: :edit_user_registration
    get 'profile/cancel'  => 'devise/registrations#cancel', as: :cancel_user_registration
  end

  devise_for :users,
             :path => '/',
             :path_names => {
               sign_in:      'signin',
               sign_out:     'signout',
               sign_up:      '',
               registration: 'register',
               edit:         'edit',
               cancel:       'cancel',
               confirmation: 'verification',
             }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'channels#index'

  resources :channel_messages
  resources :channels
end
