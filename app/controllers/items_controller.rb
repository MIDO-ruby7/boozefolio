class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.find_or_initialize_by(name: item_params[:name])

    if @item.new_record?
      @item.save
      redirect_to items_path, notice: '新種を登録しました'
    else
      @item.update(image: item_params[:image])
      redirect_to root_path, notice: '画像を登録しました'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :image_cache)
  end
end
