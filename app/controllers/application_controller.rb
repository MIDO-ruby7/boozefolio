class ApplicationController < ActionController::Base
  helper_method :current_user, :own?, :logged_in?
  add_flash_types :success, :info, :warning, :danger
  before_action :set_paper_trail_whodunnit # PaperTrail
  before_action :logged_in_user

  # ログイン中のユーザーを返す
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ユーザーがオブジェクトの所有者であればtrue、その他ならfalseを返す
  def own?(object)
    current_user == object.user
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    return if logged_in?

    flash[:danger] = t('defaults.login_required')
    redirect_to root_path
  end
end
