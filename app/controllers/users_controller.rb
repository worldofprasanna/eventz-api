class UsersController < ApplicationController
  # before_action :require_login

  def show
  end

  def create
    @user = User.new(user_params)
    @user.confirmation_token = Clearance::Token.new
    if @user.save
      data = { 'token': @user.confirmation_token, 'name': "#{@user.first_name} #{@user.last_name}" }
      SendgridMailer.send(@user, :USER_CONFIRMATION, data)
      render json: { 'msg': 'User created successfully' }
    else
      render json: { 'msg': 'Some issue in creating the user' }, status: 500
    end
  end

  def confirm_by_email
    user = User.find_by!(confirmation_token: params[:token])
    if user.present?
      user.confirm
      sign_in user
      render json: { 'msg': 'User confirmed successfully' }
    else
      render json: { 'msg': 'Invalid token / Expired token' }, status: 400
    end
  end

  def update
    if current_user.update_attributes(user_params)
      render :show
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
