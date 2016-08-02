class Store

  def self.service
     @service ||= StoreService.new
  end

  def self.search_stores_by_zip_code(zip_code)
    store_search_response = service.get_stores_by_zip_code(zip_code)
  end

  def total_stores
    Store.search_store_by_zip_code(zip_code)["total"]
  end

  def stores
    Store.search_store_by_zip_code(zip_code)["stores"]
  end 


  private
    def zip_code
      @_zip_code
    end

end
