CvApp::Application.routes.draw do

  #root route here
  root 'site#index'

  get  'login' => 'session#new'
  post 'login' => 'session#create'

  scope :api do
    get '' => "api#index", as: :api, defaults: {format: :json}

    resources :users, except: [ :edit, :new ], defaults: {format: :json} do
      get ':id' => "users#show", on: :collection
    end

  end


end
