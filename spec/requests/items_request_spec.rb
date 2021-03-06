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

    expect(response.status).to eq(200)

    parsed_response = JSON.parse(response.body)

    expect(parsed_response.kind_of?(Hash)).to eq(true)
    expect(parsed_response["name"]).to eq(item.name)
    expect(parsed_response["description"]).to eq(item.description)
    expect(parsed_response["image_url"]).to eq(item.image_url)
  end

  it "delete an item" do
    item = create_item
    item2 = create_item

    expect(Item.count).to eq(2)

    delete "/api/v1/items/1"

    expect(response.status).to eq(204)

    expect(Item.count).to eq(1)
  end

  it "adds an item" do
    item = create_item
    item2 = create_item
    item_params = {name: "Name", description: "Description",
                   image_url: "www.google.com"}

    expect(Item.count).to eq(2)

    post "/api/v1/items", item_params

    expect(response.status).to eq(201)
    expect(Item.count).to eq(3)

    parsed_response = JSON.parse(response.body)

    expect(parsed_response["name"]).to eq("Name")
    expect(parsed_response["description"]).to eq("Description")
    expect(parsed_response["image_url"]).to eq("www.google.com")
  end

end
