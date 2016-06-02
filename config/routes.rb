Rails.application.routes.draw do

  root :to => proc { [404, {}, ['Not found.']] }

  namespace :admin do
    resources :tests, :only => [:index]
  end

  resources :projects, :only => [] do
    member do
      get :disabled
    end

    resources :preorders, :only => [:new, :create] do
      collection do
        get :success
      end
    end
  end

  get '/preorders/confirm/:token', :to => 'preorders#confirm'
end
