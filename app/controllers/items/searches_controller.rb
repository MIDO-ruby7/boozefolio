class Items::SearchesController < ApplicationController
  def index
    @items = Item.all
  end

  def search
    #paramsとして送られてきたkeyword（入力された語句）で、Itemモデルのnameカラムを検索し、その結果を@itemsに代入する
    @items = Item.where('name LIKE ?', "%#{params[:search]}%")
    respond_to do |format|
      format.html { render partial: 'search_list', locals: { items: @items } }
      format.json { render json: @items }
    end
  end
end
