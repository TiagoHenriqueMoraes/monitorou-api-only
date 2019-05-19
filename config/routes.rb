Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  namespace :api do
    namespace :v1 do
      resources :study_groups do
        post :join_group, as: :join_group, on: :collection
      end
      resources :attendances, on: :collection
      resources :events, except: [:show]
      resources :sessions, only: %i[create destroy]
      resources :questionnaires
      resources :questionnaire_answers, only: %i[index create]
      resources :users do
        get ":id/attendances", action: :attendances, on: :collection
      end
      resources :courses, except: [:show]
      resources :subjects, except: %i[show destroy]
      resources :institutions, except: [:show]
      resources :contents, except: [:show]
      resources :worktimes, except: %i[show create]
    end
  end
end
