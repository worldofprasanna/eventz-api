Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    resources :events
    resources :conferences do
      resources :talks
    end
    resources :speakers
  end
end
