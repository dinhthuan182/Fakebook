class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash.now[:'alert-success'] = 'Đăng nhập thành công'
      log_in(user)
      redirect_to user
    else
      flash.now[:'alert-danger'] = 'user/password không đúng'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
