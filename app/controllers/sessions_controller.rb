class SessionsController < Clearance::SessionsController
  def create
    @user = authenticate(params)
    sign_in(@user) do |status|
      if status.success?
        render json: { id: @user.id, is_admin: @user.is_admin }
      else
        render json: { status: status.failure_message }, status: 401
      end
    end
  end

  def destroy
    sign_out
    render json: { msg: 'successfully logged out' }
  end
end
