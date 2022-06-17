# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :v1, defaults: { format: 'json' } do
    get 'greetings', to: 'greetings#index'
  end

  # Forward all requests to the StaticController#index but requests
  # must be non-Ajax (!req.xhr?) and HTML Mime type (req.format.html?).
  # This does not include the root ("/") path.

  get '*path', to: 'static#index', constraints: lambda { |req|
                                                  req.xhr? || req.format.html?
                                                }

  root 'static#index'
end
