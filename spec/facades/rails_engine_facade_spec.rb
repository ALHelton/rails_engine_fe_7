require "rails_helper"

RSpec.describe RailsEngineFacade do
  let(:merchants) { RailsEngineFacade.new.all_merchants }
  let(:items) { RailsEngineFacade.new.merchant_items(1) }
  let(:merchant_1) { RailsEngineFacade.new.merchant_by_id(1) }

  describe "It creates poros for" do
    it "Merchants" do
      expect(merchants.first).to be_a(Merchant)
      expect(merchants.first.id).to be_a(String)
      expect(merchants.first.name).to be_a(String)
    end

    it "Merchant by id" do
      expect(merchant_1).to be_a(Merchant)
      expect(merchant_1.id).to be_a(String)
      expect(merchant_1.name).to be_a(String)
    end

    it "Merchant Items" do
      expect(items.first).to be_an(Item)
      expect(items.first.id).to be_a(String)
      expect(items.first.name).to be_a(String)
      expect(items.first.description).to be_a(String)
      expect(items.first.unit_price).to be_a(Float)
    end
  end
end