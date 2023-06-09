class GoogleLoginApiController < ApplicationController
  require 'googleauth/id_tokens/verifier'
  protect_from_forgery except: :callback
  before_action :verify_g_csrf_token, only: %i[callback]
  skip_before_action :logged_in_user, only: %i[callback]

  def callback
    payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: ENV['GOOGLE_CLIENT_ID'])
    user = User.find_or_create_by(email: payload['email']) do |u|
      u.name = payload['name']
    end
    session[:user_id] = user.id
    redirect_to items_path, notice: t('google_login_api.callback.success')
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, status: :see_other, notice: t('google_login_api.destroy.success')
  end

  private

  def verify_g_csrf_token
    if cookies['g_csrf_token'].blank? || params[:g_csrf_token].blank? || cookies['g_csrf_token'] != params[:g_csrf_token]
      redirect_to root_path, alert: t('.fail')
    end
  end
end
