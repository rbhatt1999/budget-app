class CategoriesController < ApplicationController
  load_and_authorize_resource

  # GET /categories or /categories.json
  def index
    @categories = Category.where(author: current_user)
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])
    @purchases = @category.purchases.order('created_at DESC')
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.author = current_user
    if @category.save
      redirect_to categories_url, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
