class StaticPagesController < ApplicationController
  skip_before_action :logged_in_user, only: %i[top guide terms privacy]
  def top
    render layout: false
  end

  def contact; end

  def terms; end

  def privacy; end
end
