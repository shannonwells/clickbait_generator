Rails.application.routes.draw do

  namespace :home do
    get 'index'
    get 'about'
    get 'generate'
  end

  resource :clickbaits, only: [:create]

  get '/slackbot/generate', to: 'home#slackbot_generate'

  root 'home#index'
end
