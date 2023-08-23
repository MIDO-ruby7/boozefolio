class UserItemsController < ApplicationController
  def index
    @user_items = current_user.user_items.order(created_at: :desc)
  end
end
