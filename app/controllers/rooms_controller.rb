class RoomsController < ApplicationController
  layout 'bubble'
  def show
    @messages = Message.includes(:user).all
  end
end
