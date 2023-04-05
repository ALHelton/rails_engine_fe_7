require "rails_helper"

RSpec.describe "Merchant Index", type: :feature do
  before do

  end

  describe "As a visitor" do
    it "I see a list of merchants by name" do
      visit merchants_path
      expect(page).to have_content("Merchants")
      expect(page).to have_content("Hand-Spencer")
    end

    it "I click merchant's name, am routed to '/merchants/:id'" do
      visit merchants_path
      expect(page).to have_link("Hand-Spencer")
      click_link "Hand-Spencer"
      expect(current_path).to eq("/merchants/9")
    end
  end
end