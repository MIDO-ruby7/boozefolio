class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: '新しいカテゴリーを登録しました'
    else
      redirect_to action: :new
    end
  end

  def edit; end

  def update
   if @category.update(category_params)
    redirect_to categories_path, notice: 'カテゴリーを更新しました'
    else
      redirect_to action: :edit
   end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'カテゴリーを削除しました'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
