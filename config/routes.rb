Rails.application.routes.draw do


  namespace :enterprise do

    get 'homes/top' => "homes#top", as: "top"
    get 'homes/about' => "homes#about", as: "about"

    resource :enterprises, only: [:show, :edit, :update]
    get '/business_content' => "enterprises#business_content", as: "business_content"
    patch '/business_content' => "enterprises#business_content_update", as: "business_content_update"
    get '/withdrawal' => "enterprises#withdrawal", as: "withdrawal"
    patch '/withdrawal' => "enterprises#withdrawal_update", as: "withdrawal_update"

    resources :users, only: [:show, :index]

  end


  scope module: :user do

    get '/' => 'homes#top', as: 'top'
    get '/about' =>'homes#about', as: 'about'

    resource :users, only: [:show, :edit, :update]
    get 'users/skill_sheet_edit' => 'users#skill_sheet_edit', as: 'skill_sheet_edit'
    patch 'users/skill_sheet_edit' => 'users#skill_sheet_update', as: 'skill_sheet_update'
    get 'users/desired_condition_edit' => 'users#desired_condition_edit', as: 'desired_condition_edit'
    patch 'users/desired_condition_edit' => 'users#desired_condition_update', as: 'desired_condition_update'
    get 'users/self_pr_edit' => 'users#self_pr_edit', as: 'self_pr_edit'
    patch 'users/self_pr_edit' => 'users#self_pr_update', as: 'self_pr_update'

  end

    devise_for :enterprises, controllers: {
        sessions:      'enterprise/sessions',
        passwords:     'enterprise/passwords',
        registrations: 'enterprise/registrations'
    }

    devise_for :users, controllers: {
        sessions:      'user/sessions',
        passwords:     'user/passwords',
        registrations: 'user/registrations'
    }

end
