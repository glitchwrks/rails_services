Rails.application.routes.draw do

  root :to => proc { [404, {}, ['Not found.']] }

  resources :projects, :only => [] do
    member do
      get :disabled
    end
  end

  resources :preorders, :only => [:new, :create] do
    collection do
      get :success
      get :confirm
    end
  end

end
