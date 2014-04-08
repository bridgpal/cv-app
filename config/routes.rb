CvApp::Application.routes.draw do

  #root route here

  scope :api do
    get '' => "api#index", as: :api, defaults: {format: :json}

    resources :users, except: [ :edit, :new ], defaults: {format: :json} do
      get ':id' => "users#show", on: :collection
    end

  end


end
