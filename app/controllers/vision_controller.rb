class VisionController < ApplicationController
  def index
    uploard_file = params[:image]
    if uploard_file != nil
      #画像のアップロード
      @vison = Vison.create()
      
    end
  end
end
