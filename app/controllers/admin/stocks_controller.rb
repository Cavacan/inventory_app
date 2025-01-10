class Admin::StocksController < ApplicationController
  def index
    @stocks = Stock.includes(:product).all
    #@products_with_stocks = Product.left_joins(:stock).select('products.*, stocks.quantity AS stock_quantity, stocks.purchase_price AS stock_purchase_price, stocks.supplier AS stock_supplier')
  end

  def replenish
    ActiveRecord::Base.transaction do
      stock = Stock.find(params[:id])
      stock.quantity = stock.quantity.to_i + params[:stock][:quantity].to_i
      stock.purchase_price = params[:stock][:purchase_price].to_i
      stock.supplier = params[:stock][:supplier]
      stock.save!

      ReplenishmentHistory.create!(
        product_id: stock.product_id,
        quantity: params[:stock][:quantity],
        purchase_price: params[:stock][:purchase_price],
        supplier: params[:stock][:supplier]
      )
    end
    redirect_to admin_stocks_path, notice:  "在庫を補充しました。"
  rescue ActiveRecord::RecordInvalid => e
    redirect_to admin_stocks_path, alert:  "補充に失敗しました: #{e.message}"
  end
end
