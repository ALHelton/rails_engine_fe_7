require "rails_helper"

RSpec.describe "Merchant Index", type: :feature do
  before do

  end

  describe "As a visitor" do
    it "List of merchants by name" do
      visit merchants_path
      expect(page).to have_content("Merchants")
    end
  end
end