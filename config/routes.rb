Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions:      'job_seeker/sessions',
  passwords:     'job_seeker/passwords',
  registrations: 'job_seeker/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
