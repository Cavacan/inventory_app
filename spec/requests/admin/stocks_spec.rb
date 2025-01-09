require 'rails_helper'

RSpec.describe "Admin::Stocks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/stocks/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/admin/stocks/update"
      expect(response).to have_http_status(:success)
    end
  end

end
