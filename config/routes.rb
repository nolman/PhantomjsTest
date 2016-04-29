Rails.application.routes.draw do
  get '/', to: 'welcomes#index'
  get '/slow', to: 'welcomes#slow'
end
