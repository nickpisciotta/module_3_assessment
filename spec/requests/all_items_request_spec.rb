require 'rails_helper'

describe "Items Controller" do
  it "returns all the items" do
    item = create_item
    item2 = create_item

    get "/api/v1/items"

    expect(response.status).to eq(200)

    parsed_response = JSON.parse(response.body)

    expect(parsed_response.count).to eq(2)
    expect(parsed_response.first["name"]).to eq(item.name)
    expect(parsed_response.first["description"]).to eq(item.description)
    expect(parsed_response.first["image_url"]).to eq(item.image_url)
  end

  it "returns one item" do
    item = create_item
    item2 = create_item

    get "/api/v1/items/1"

    expect(reponse.status).to eq(200)

    parsed_response = JSON.parse(response.body)

    expect(parsed_response.count).to eq(1)
    expect(parsed_response["name"]).to eq(item.name)
    expect(parsed_response["description"]).to eq(item.description)
    expect(parsed_response["image_url"]).to eq(item.image_url)
  end
end
