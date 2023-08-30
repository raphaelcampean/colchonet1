module ApplicationHelper
    def error_tag(model, attribute)
        
        if model.errors.has_key? attribute
        content_tag(
        :div,
        model.errors[attribute].first,
        class: 'error_message'
        )
        end
    end

    #Colchonet::Application.routes.draw do
     #   scope ":locale" do
      #      resources :rooms
       #     resources :users
        #end

        #root 'home#index'
    #end
end
