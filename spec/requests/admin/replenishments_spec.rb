require 'rails_helper'

RSpec.describe "Admin::Replenishments", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/replenishments/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/admin/replenishments/update"
      expect(response).to have_http_status(:success)
    end
  end

end
