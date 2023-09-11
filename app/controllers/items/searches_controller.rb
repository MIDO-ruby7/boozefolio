class Items::SearchesController < ApplicationController
  def index
    @items = Item.all
  end

  def search
    query = params[:query]
    yahoo_genre_category_id = params[:yahoo_genre_category_id]
    @items = Item.where('name LIKE ?', "%#{query}%")

    if @items.present?
      render_items_as_json(@items)
    else
      items_data = YahooApi.item_search(query, yahoo_genre_category_id)
      render_items_as_json(items_data)
    end
  end

  def barcode_search
    barcode_value = params[:barcode]
    jan_code_items_data = YahooApi.jan_code_search(barcode_value)
    render_items_as_json(jan_code_items_data)
  end

  private

  def render_items_as_json(data)
    respond_to do |format|
      format.json { render json: data }
    end
  end
end
