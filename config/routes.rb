UserManager::Engine.routes.draw do
  devise_for :users, class_name: "UserManager::User", module: :devise

  scope "/admin" do
    resources :users do
      get :activate, on: :member
    end
  end
end
