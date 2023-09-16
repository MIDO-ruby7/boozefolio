class StaticPagesController < ApplicationController
  skip_before_action :logged_in_user, only: %i[top guide terms privacy entrance verified contact]
  before_action :verify_entrance_yes_cookie, only: %i[top]

  def top
    render layout: false
  end

  def entrance
    render layout: false
  end

  def verified
    choice = params[:choice]
    session_yes(choice)
    write_cookie
    return redirect_to root_path
  end

  def contact; end

  def terms; end

  def privacy; end

  private

  def session_yes(choice)
    if choice == 'yes'
      session[:entrance_yes] = 'yes'
    end
  end

  def verify_entrance_yes_cookie
    if cookies[:entrance_yes].blank?
      redirect_to entrance_path
    end
  end

  def write_cookie
    cookies[:entrance_yes] = { value: 'yes', expires: 1.year.from_now }
  end
end
