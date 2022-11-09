# frozen_string_literal: true

Rails.application.routes.draw do
  resources :applications, param: :token, except: [:destroy] do
    resources :chats, param: :number, controller: 'applications/chats' do
      resources :messages, param: :number, controller: 'applications/chats/messages' do
        collection do
          get :search
        end
      end
    end
  end
end
