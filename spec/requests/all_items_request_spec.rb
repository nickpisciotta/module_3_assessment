require 'rails_helper'

describe "Items, All Controller" do
  it "returns all the items" do
    item = create_item

    get "/api/v1/items"

    expect(response.status).to eq(200)
    expect(json.count).to eq(1)


  end
end
