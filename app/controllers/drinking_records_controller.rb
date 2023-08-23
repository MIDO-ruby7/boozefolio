class DrinkingRecordsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @drinking_record = current_user.drinking_records.build(item: @item)
    # user_item = current_user.user_items.find_or_create_by(item: @item)

    if @drinking_record.save
      user_item = current_user.user_items.find_by(item: @item)
      binding.pry
      if user_item.nil?
        current_user.user_items.create(item: @item)  # 新たにレコードを作成
        redirect_to new_page_item_path(@item), notice: t('.new_item')
      else
        redirect_to user_items_path, notice: t('.success')
      end
    else
      redirect_to items_path, alert: t('.fail')
    end
  end
end
