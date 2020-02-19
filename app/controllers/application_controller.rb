class ApplicationController < ActionController::Base
  include Clearance::Controller

  # before_action :require_login
  protect_from_forgery with: :null_session
  respond_to :json

end
