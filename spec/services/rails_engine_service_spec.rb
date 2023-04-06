require "rails_helper"

RSpec.describe RailsEngineService do
  let(:re_service) { RailsEngineService.new }
  let(:all_merchants) { RailsEngineService.new.get_all_merchants }
  let(:one_merchant) { RailsEngineService.new.get_merchant(1) }
  let(:merchant_items) { RailsEngineService.new.get_merchant_items(1) }

  describe "It establishes a connection for" do
    it "URL 'http://localhost:3000/api/v1" do
      expect(re_service.connection).to be_a(Faraday::Connection)
      expect(re_service.connection.url_prefix.to_s).to eq("http://localhost:3000/")
    end

    it "all merchants" do
      expect(all_merchants).to be_an(Array)
      expect(all_merchants[0].keys).to eq([:id, :type, :attributes])
      expect(all_merchants[0][:attributes].count).to eq(1)
      expect(all_merchants[0][:attributes][:name]).to be_a(String)
      expect(all_merchants[0][:type]).to eq("merchant")
    end

    it "one merchant" do
      expect(one_merchant).to be_a(Hash)
      expect(one_merchant.keys).to eq([:id, :type, :attributes])
      expect(one_merchant[:attributes].count).to eq(1)
      expect(one_merchant[:attributes].keys).to eq([:name])
      expect(one_merchant[:attributes][:name]).to be_a(String)
      expect(one_merchant[:type]).to eq("merchant")
    end

    it "merchant items" do
      expect(merchant_items).to be_an(Array)
      expect(merchant_items[0].keys).to eq([:id, :type, :attributes])
      expect(merchant_items[0][:attributes].keys).to eq([:name, :description, :unit_price, :merchant_id])
      expect(merchant_items[0][:type]).to eq("item")
      expect(merchant_items[0][:attributes][:name]).to be_a(String)
      expect(merchant_items[0][:attributes][:description]).to be_a(String)
      expect(merchant_items[0][:attributes][:unit_price]).to be_a(Float)
      expect(merchant_items[0][:attributes][:merchant_id]).to be_a(Integer)
    end
  end
end