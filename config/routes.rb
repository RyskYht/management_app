Rails.application.routes.draw do
  resources :managers, :schools, :teachers, :families, :rooms, :announcements, :lessons, :tasks, :tuitions

  get     "/", to: "home#top"
  get     "login", to: "home#login_form"
  post    "login", to: "home#login"
  get     "logout", to: "home#logout"
  get     "dashboard", to: "home#dashboard"
  
  get     "/students", to: "students#index"
  get     "/students/:family_id", to: "students#family_index"
  post    "/students/:family_id", to: "students#create"
  get     "/students/:family_id/new", to: "students#new"
  get     "/students/:family_id/:id", to: "students#show"
  get     "/students/:family_id/:id/edit", to: "students#edit"
  patch   "/students/:family_id/:id", to: "students#update"
  put     "/students/:family_id/:id", to: "students#update"
  delete  "/students/:family_id/:id", to: "students#destroy"
end
