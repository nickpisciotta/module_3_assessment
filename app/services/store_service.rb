class StoreService

  def initialize
    @_connection = Faraday.new("https://api.bestbuy.com/v1/")
    @_connection.params["apiKey"]   = ENV["best_buy_api_key"]
    @_connection.params["format"]   = "json"
    @_connection.params["show"]     = "storeType,name,city,distance,phone"
    @_connection.params["pageSize"] = 2
  end

  def get_stores_by_zip_code(zip_code)
    response = connection.get("stores(area(#{zip_code},25))")
    parse(response)
    byebug
  end

  private
    def connection
      @_connection
    end

    def parse(response)
      JSON.parse(response.body)
    end
end
