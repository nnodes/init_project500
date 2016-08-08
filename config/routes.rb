Rails.application.routes.draw do
  resources :users
  devise_for :users, :path_prefix => 'my', :controllers => {:registrations => "registrations"}
  devise_scope :user do
      authenticated :user do
        root 'home#index', as: :authenticated_root
      end

      unauthenticated do
        root 'devise/sessions#new', as: :unauthenticated_root
      end  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
