class ItemsController < ApplicationController
  require "mini_magick"
  before_action :set_item, only: %i[edit update destroy]

  def index
    @items = Item.all.includes(:photos).order(created_at: :desc)
  end

  # 画像のアップロード機能
  def new
    @item = Item.new
    @item.photos.build
  end

  def create
    @item_name = current_user.items.find_or_initialize_by(name: item_params[:name])
    @item = current_user.items.build(item_params)
    if @item_name.new_record?
      if @item.save
        session[:new_item_id] = @item.id
        redirect_to new_page_item_path(@item)
      else
        flash.now[:alert] = t('.fail')
        render :new, status: :unprocessable_entity
      end
    else
      @item.photos.create(image: item_params[:photos_attributes]['0'][:image])
      redirect_to items_path, notice: t('.success')
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit; end

  def update
    @item.update(item_params)
    redirect_to items_path, notice: t('.success')
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: t('.success'), status: :see_other
  end

  def new_page
    @new_item = Item.find(session[:new_item_id]) if session[:new_item_id]
    session[:new_item_id] = nil # セッションから削除
    render layout: false
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :size, :flavor, :maker, :alcohol_content, :country_of_origin, :region, :link, :note, :asin, :category_id,
      photos_attributes: [:image, :id, :item_id, :image_cache]
    )
  end

  def set_item
    @item = current_user.items.find(params[:id])
  end
end
