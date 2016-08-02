class Store

  def initialize(zip_code)
    @_zip_code = zip_code
  end

  def self.service
    @service ||= StoreService.new(@zip_code)
  end

  def self.search_stores_by_zip_code(zip_code)
    store_search_response = service.get_stores_by_zip_code(zip_code)
    # store_search = store_search_response
    byebug
  end

  private
    def zip_code
      @_zip_code
    end

end
