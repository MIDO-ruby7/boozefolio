class UserItemsController < ApplicationController
  def index
    @user_items = current_user.user_items.order(item_id: :asc)
  end
end
