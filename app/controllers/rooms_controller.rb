class RoomsController < ApplicationController
  layout 'timeline'
  def show
    @messages = Message.includes(:user).all
  end
end
