class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    email = params_user[:email]
    password = params_user[:password]

    #USING PRE-MADE "LOGIN" METHOD FROM GEM SORCERY; EMAIL AND PASSWORDDS ARE USED TO LOGIN

    if login(email, password)
      redirect_to root_url, notice: "successfully logged in"
    else
      @user = User.new(email: email)
      render :new
    end
  end


  private
  def params_user
    params.require(:user).permit(:email, :password)
  end
end
