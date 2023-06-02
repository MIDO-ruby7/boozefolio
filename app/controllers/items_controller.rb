class ItemsController < ApplicationController
  require 'httparty'

  def index
    @items = Item.all
  end

  #画像のアップロード機能
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path, notice: '画像を投稿しました'
    else
      flash.now[:alert] = '画像の投稿に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :image_cache)
  end
end
