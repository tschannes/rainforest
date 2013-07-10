class CategoriesController < ApplicationController
  
  # before_filter :load_product

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create

    @category = Category.new(category_params)

    if @category.save
      redirect_to root_path, notice: 'category created successfully'
    else
      render :action => :show
    end
  end

  def destroy
    @category = category.find(params[:id])
    @category.destroy
  end

  private

  def load_product
    @product = Product.find(params[:product_id])
    @category = @product.category
  end

  def category_params
    params.require(:category).permit(:description)
  end

end
