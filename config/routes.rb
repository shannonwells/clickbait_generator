Rails.application.routes.draw do

  namespace :home do
    get 'index'
    get 'about'
    post 'generate'
    get 'generate'
  end

  get '/slackbot/generate', to: 'home#slackbot_generate'

  root 'home#index'

end
