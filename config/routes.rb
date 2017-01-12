Rails.application.routes.draw do
  get 'bikes/index'

  root 'bikes#index'
end
