Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :study_groups, only: [:create, :destroy, :index]
      resources :sessions, only: [:create, :destroy]
      resources :users
      resources :courses, except: [:show]
      resources :subjects, except: [:show, :destroy]
      resources :institutions, except: [:show]
      resources :worktimes, only: [:index]
    end
  end
end
