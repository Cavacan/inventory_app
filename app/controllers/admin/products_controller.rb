class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: '商品を作成しました。'
    else
      render :new, alert: '商品の作成に失敗しました。'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path, notice: '商品情報を更新しました。'
    else
      render :edit, alert: '商品情報の更新に失敗しました。'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.update(active: false)
    redirect_to admin_products_path, notice: '商品を無効化しました。'
  end

  private

  def product_params
    params.require(:product).permit(:code, :name, :max_quantity, :price, :start_date, :end_date, :version, :active)
  end
end
