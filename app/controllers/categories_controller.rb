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
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
   if @category.update(category_params)
    redirect_to categories_path, notice: 'カテゴリーを更新しました'
    else
      render :edit, status: :unprocessable_entity
   end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'カテゴリーを削除しました'
  end

  def default_values
    category = Category.find(params[:id])
    render json: {
      default_alcohol_content: category.default_alcohol_content,
      default_size: category.default_size
    }
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
