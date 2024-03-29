class DrinkingRecordsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @drinking_record = current_user.drinking_records.build(item: @item)

    if @drinking_record.save
      user_item = current_user.user_items.find_by(item: @item)
      if user_item.nil?
        current_user.user_items.create(item: @item)  # 新たにレコードを作成
        redirect_to new_page_item_drinking_records_path(@item)
      else
        redirect_to user_items_path, notice: t('.success')
      end
    else
      redirect_to items_path, alert: t('.fail')
    end
  end

  def new_page
    @item = Item.find(params[:item_id])
    render layout: false
  end
end
