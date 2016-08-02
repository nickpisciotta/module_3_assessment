require 'rails_helper'

RSpec.describe StoreService do
  context "#get_stores_by_zip_code" do
  it "returns all stores" do
    VCR.use_cassette("store_by_zip") do
      zip_code = "80202"
      faraday_connection = Faraday.new("https://api.bestbuy.com/v1/")
      faraday_connection.params["apiKey"]   = ENV["best_buy_api_key"]
      faraday_connection.params["format"]   = "json"
      faraday_connection.params["show"]     = "storeType,name,city,distance,phone"
      faraday_connection.params["pageSize"] = 2
      faraday_response = faraday_connection.get("stores(area(#{zip_code},25))")
      parsed_response = JSON.parse(faraday_response.body)
      expected_total_store = parsed_response["total"]

      connection = StoreService.new
      response = connection.get_stores_by_zip_code(zip_code)

      expect(expected_total_store).to eq(response["total"])
      end
    end
  end
end
