class StampsController < ApplicationController
  def index
    @stamps = Stamp.all.order(created_at: :desc)
  end

  def new
    @stamp = Stamp.new
  end

  def create
    @stamp = Stamp.new(stamp_params)
    if @stamp.save
      redirect_to stamps_path,  notice: t('.success'), status: :see_other
    else
      flash.now[:alert] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @stamp = Stamp.find(params[:id])
    @stamp.destroy!
    redirect_to stamps_path, notice: t('.success'), status: :see_other
  end

  private

  def stamp_params
    params.require(:stamp).permit(:name, :image, :image_cache)
  end
end
