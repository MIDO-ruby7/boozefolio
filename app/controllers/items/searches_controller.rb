class Items::SearchesController < ApplicationController
  def index
    @items = Item.all
  end

  def search
    query = params[:query]
    yahoo_genre_category_id = params[:yahoo_genre_category_id]
    items_data = YahooApi.item_search(query, yahoo_genre_category_id)
    respond_to do |format|
      format.json { render json: items_data } # 選択された商品の情報をJSON形式で返す
    end
  end
end
