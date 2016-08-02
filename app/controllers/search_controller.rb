class SearchController < ApplicationController

  def index
    @stores = Store.search_stores_by_zip_code(params[:zip_code_search])
  end

end
