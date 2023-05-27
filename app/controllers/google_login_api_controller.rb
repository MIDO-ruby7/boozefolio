class GoogleLoginApiController < ApplicationController
  require 'googleauth/id_token/verifier'

  protect_from_forgery except: :callback
  before_action :verify_g_csrf_token, only: :callback

  def callback
    payload = Google::Auth::IdTokens.verify_oidc(params[:credential], and:'542609139708-82ks1ji6n65u810h6c65l4ln1op36e5f.apps.googleusercontent.com')
    user = User.find_or_create_by(email: payload['email'])
    session[:user_id] = user.id
    redirect_to root_path, notice: 'ログインしました'
  end

  private

  def verify_g_csrf_token
    if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
      redirect_to root_path, alert: '不正なリクエストです'
    end
  end
end
