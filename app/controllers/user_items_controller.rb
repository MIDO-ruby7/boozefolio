class UserItemsController < ApplicationController
  layout 'bubble', only: %i[index]
  def index
    @user_items = current_user.user_items.includes(:photos).order(item_id: :asc)
  end
end
