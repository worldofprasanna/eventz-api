Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    resources :events
    resources :conferences do
      resources :talks
      member do
        get 'speakers' => 'conferences#speakers'
        post 'add_speaker_to_conference', to: 'speakers#add_speaker_to_conference'
      end
    end
    resources :speakers
    get '/promo_codes/:code/apply_discount', to: 'promo_code#apply_discount'
    resources :payments do
      collection do
        post :checkout_session
        get 'confirm/:session_id' => 'payments#confirm'
        post :confirmation_from_payment_gateway
      end
    end
    resources :user, only: [:show]
  end
end
