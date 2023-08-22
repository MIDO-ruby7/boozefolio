class DrinkingRecordsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @drinking_record = current_user.drinking_records.build(item: @item)

    if @drinking_record.save
      user_item = current_user.user_items.find_or_create_by(item: @item)
      #もしuser_items.find_or_create_byでuser_itemが作成されたら、「図鑑に登録されました！」のフラッシュメッセージを表示する
      if user_item.new_record?
        redirect_to new_page_item_path(@item), notice: t('.new_item')
      else
        redirect_to user_items_path, notice: t('.success')
      end
    else
      redirect_to items_path, alert: t('.fail')
    end
  end
end
