module RouteScope
  def self.root
    Rails.application.config.root_directory
  rescue NameError
    '/'
  end
end

Rails.application.routes.draw do
  scope RouteScope.root do

    root :to => proc { [404, {}, ['Not found.']] }

    resources :messages, :only => [:new, :create] do
      collection do
        get :success
      end
    end

    resources :pastes, :only => [:show]

    resources :projects, :only => [:index] do
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

    resources :testfdc_results, :only => [:index, :new, :create] do
      collection do
        get :success
      end
    end

    namespace :api, :constraints => { :format => 'json' } do
      resources :pastes, :only => [:create]

      resources :testfdc_notes, :only => [:index, :create]

      resources :testfdc_results, :only => [:index, :destroy, :create] do
        collection do
          get :unapproved
        end

        member do
          put :approve
        end
      end

    end
  end
end
