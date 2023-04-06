require "rails_helper"

RSpec.describe Item do
  let(:item) {RailsEngineFacade.new.merchant_items(1).sample}

  it "Creates an Object for item" do
    expect(item.id).to be_a(String)
    expect(item.name).to be_a(String)
    expect(item.description).to be_a(String)
    expect(item.unit_price).to be_a(Float)
    expect(item.merchant_id).to be_an(Integer)
  end
end