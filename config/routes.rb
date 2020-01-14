Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    resources :events
    resources :conferences do
      resources :talks
      member do
        get 'speakers' => 'conferences#speakers'
      end
    end
    resources :speakers
  end
end
