class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])

    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_url, notice: t('user.log_in')
    else
      flash.now.alert = t('user.bad_auth')
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: t('user.log_out')
  end
end
