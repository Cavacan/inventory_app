require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      user: nil,
      product: nil,
      quantity: 1,
      total_price: 1
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[user_id]"

      assert_select "input[name=?]", "order[product_id]"

      assert_select "input[name=?]", "order[quantity]"

      assert_select "input[name=?]", "order[total_price]"
    end
  end
end
