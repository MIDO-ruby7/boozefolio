class UserItemsController < ApplicationController
  def index
    @user_items = current_user.user_items.includes(:photos).order(item_id: :asc)
  end
end
