class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end
  
  def create
    user = Account.find_by_email(params[:email])
    if user && Account.find_by_password(params[:password])
      session[:id] = user.id
      render json: {
        message: "success"
      }

    else
      render json: {
        message: "failed"
      }
    end
  end
  
  def destroy
    session[:id] = nil
    redirect_to '/'
  end
  private
    def account_params
        params.require(:account).permit(:id, :email, :password)
    end
end
