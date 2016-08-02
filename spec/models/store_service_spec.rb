require 'rails_helper'

RSpec.describe StoreService do
  context "#get_stores_by_zip_code" do
  it "returns all stores" do
    VCR.use_cassette("total_steps") do
      zip_code = "80202"
      connection = StoreService.new
      response = connection.get_stores_by_zip_code(zip_code)

      end
    end
  end
end
