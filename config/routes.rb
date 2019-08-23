Rails.application.routes.draw do
  devise_for :users
	resources :notes do 
		collection do
			get :borrow
			get :borrowers_list
			get :return
		end
	end
	root to: "notes#index"
	resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
