razorpay_key_id = Rails.application.credentials.razorpay[Rails.env.to_sym][:key]
razorpay_secret = Rails.application.credentials.razorpay[Rails.env.to_sym][:secret]

Razorpay.setup(razorpay_key_id, razorpay_secret)