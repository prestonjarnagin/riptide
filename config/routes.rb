Rails.application.routes.draw do

  get '/', to: "home#index"
  get '/update', to: "home#show"
end
