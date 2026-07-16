Colchonet::Application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
	resources :rooms
	resources :users
	# Aqui estarão vários comentários gerados pelo Rails para
	# te ajudar a lembrar e entender como funciona
	# o roteador.

	resources :rooms do
		resources :reviews, only: [:create, :update], module: :rooms
	end

	resource :confirmation, only: [:show]
	resource :user_sessions, only: [:create, :new, :destroy]
	get '/user_sessions', to: 'user_sessions#destroy'

	root 'home#index'
end
