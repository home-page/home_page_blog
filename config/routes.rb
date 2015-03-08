Rails.application.routes.draw do
  resources :posts do
    member do
      put :publish
      put :unpublish
    end
  end
end
