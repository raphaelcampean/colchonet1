Colchonet::Application.routes.draw do
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

	root 'home#index'
end
