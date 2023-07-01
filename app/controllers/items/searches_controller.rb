class Items::SearchesController < ApplicationController
  def index
    @items = Item.all
  end

  def search
    #paramsとして送られてきたkeyword（入力された語句）で、Itemモデルのnameカラムを検索し、その結果を@itemsに代入する
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.json { render 'index', json: @items }
    end
  end
end
