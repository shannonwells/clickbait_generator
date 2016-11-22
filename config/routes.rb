Rails.application.routes.draw do

  namespace :home do
    get 'index'
    get 'about'
    post 'generate'
    get 'generate'
  end

  get '/headlines/:id', to: 'permalinks#show', as: 'permalinks'
  post '/headlines', to: 'permalinks#create', as: 'create_permalinks'
  get '/slackbot/generate', to: 'home#slackbot_generate'

  root 'home#index'

end
