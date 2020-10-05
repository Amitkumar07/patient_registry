Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  devise_scope :user do

    authenticated :user do
      root 'patient#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end

  end

  root 'dashboard#index', as: :root

  resources :patient do
    resources :documents
  end


  get 'import/patient', to: 'import#import_patient'
  post 'save/patient', to: 'import#save_patient'
  get 'export/patient', to: 'export#create_file'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
