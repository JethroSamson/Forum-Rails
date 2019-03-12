class LandingController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
  end
  def index
    account = Account.all
  end
  def new
    @signup = Account.new
    end
  def create
    accounts = Account.select("email").all
    @signup = Account.new(account_params)
        if @signup.save
            # UserMailer.signup_confirmation(@signup).deliver
            # session[:id] = @signup.id
            render json: {
                message: "success",
                id:  @signup.id,
                vv: session[:id]
            }
          else
            render json: {
              error_message: "email taken",
              message: "failed"
            }
        end

  end
    private
    def account_params
        params.require(:account).permit(:id, :first, :last, :email, :password, :image, :desc)
    end
end
