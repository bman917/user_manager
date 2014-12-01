Rails.application.routes.draw do

  mount UserManager::Engine => "/user_manager"
end
