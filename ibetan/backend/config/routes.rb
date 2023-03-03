Rails.application.routes.draw do

  constraints format: :json do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'auth/registrations'
    }

    resources :profiles, only: ['create', 'update']

    resources :messages, only: ['index'] do
      member do
        resources :likes, only: ['create']
      end
    end

    resources :articles, only: ['index'] do
      member do
        resources :bookmarks, :favorites, only: ['create']
      end
    end

    resources :events, only: ['index', 'show', 'create', 'update']

    resources :bookmarks, :favorites, :likes, :events, only: ['destroy']

  end


end
