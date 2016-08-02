class StoreService

  def initialize
    @_connection = Faraday.connect
    @_connection.params["apiKey"] = ENV["best_buy_api_key"]
  end

  def get_stores_by_zip_code(zip_code)

  end

end
