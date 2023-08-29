class RoomsController < ApplicationController
  def show
    @messages = Message.includes(:user).all
  end
end
