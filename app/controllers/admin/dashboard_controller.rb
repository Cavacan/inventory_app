class Admin::DashboardController < ApplicationController
  def index
    @user_count = User.count
    @product_count = Product.count
    @stock_count = Stock.sum(:quantity)
  end
end
