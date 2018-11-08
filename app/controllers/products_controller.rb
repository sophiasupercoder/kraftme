class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :check_permissions, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]
  
  # GET /products
  # GET /products.json
  
  def index
    # index for available products
    @availableproducts = Product.where.not(:quantity => 0)
  end
  
  #admin index only for admin
  def admin_index
    if current_user.has_role?(:admin)
      @products = Product.all
    else
      redirect_to products_path
    end
  end
  
  
  # for user products
  def userproducts
    @user = User.find(params[:user_id])
    @userproducts = @user.products.where.not(:quantity => 0)
  end
  
  
  
  # GET /products/1
  # GET /products/1.json
  def show
    session[:product_id] = params[:id]
  end
  
  # GET /products/new
  def new
    @product = Product.new
  end
  
  # GET /products/1/edit
  def edit
  end
  
  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.image.attach(product_params[:image]) 
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end
  
  # verify current user had permission to make changes; if not redirects to referer path and alert
  def check_permissions
    unless @product.can_change?(current_user)
      redirect_to(request.referer || root_path)
      flash[:alert] = "You are not authorised to perform that action!"
    end
  end
  
  def product_params
    params.require(:product).permit(:product_title, :description, :price, :medium, :quantity, :creator, :user_id, :image)
  end
end
