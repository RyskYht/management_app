Rails.application.routes.draw do
  resources :tuitions, :tasks, :lessons, :students, :announcements, :rooms, :families, :teachers, :schools, :managers

  get "/", to: "home#top"
  get "login", to: "home#login_form"
  post "login", to: "home#login"
  get "logout", to: "home#logout"
  get "admin", to: "home#dashboard"  
end
