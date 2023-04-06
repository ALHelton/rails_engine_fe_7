require "rails_helper"

RSpec.describe Merchant do
  let(:merchant) {RailsEngineFacade.new.all_merchants.sample}

  it "Creates an Object for Merchant" do
    expect(merchant.id).to be_a(String)
    expect(merchant.name).to be_a(String)
  end
end