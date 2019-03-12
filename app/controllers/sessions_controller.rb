class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end
  
  def create
    user = Account.find_by_email(params[:email])
    password = Account.find_by_password(params[:password])
    pass = Account.select('password').where("email = ?", params[:email])
    if user && (user.password == password.password)
      session[:id] = user.id
      render json: {
        message: "success",
        username: user.first
      }
    else
      render json: {
        # sa_email: user.password,
        # sa_password: password.password,
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
