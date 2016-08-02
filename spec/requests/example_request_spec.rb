# describe "Items, Best Day Controller" do
#   it "returns best day for an item" do
#     item1 = create(:item)
#     invoice1 = create(:invoice, created_at: Date.today)
#     invoice2 = create(:invoice, created_at: Date.today - 1)
#     invoice_item1 = create(:invoice_item, item: item1, invoice: invoice1, quantity: 20)
#     invoice_item2 = create(:invoice_item, item: item1, invoice: invoice2)
#
#     get "/api/v1/items/#{item1.id}/best_day"
#
#     expect(response.status).to eq(200)
#     expect(json.count).to eq(1)
#
#     format_json_date = Date.parse(json["best_day"]).to_s
#     format_created_date = invoice1.created_at.strftime("%Y-%m-%e")
#
#     expect(format_json_date).to eq(format_created_date)
#   end
# end
