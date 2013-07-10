class ProductsController < ApplicationController
  #before_filter :ensure_logged_in, :only => [:show]

  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def show
    #show the bloody product
    @product = Product.find(params[:id])
    #offer users the possibility to whine
    if current_user
      @review = @product.reviews.build
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  def create
    params.permit!
    @product = Product.new(params[:product])
    

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product,
        notice: 'Product was successfully created.' }
        format.json { render json: @product,
        status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors,
        status: :unprocessable_entity }
      end
    end
  end

  def update
    params.permit!
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product,
        notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors,
        status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

end
