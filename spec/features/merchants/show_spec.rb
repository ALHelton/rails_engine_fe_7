require "rails_helper"

RSpec.describe "Merchant Show", type: :feature do
  describe "As a visitor" do
    it " I see a list of items that merchant sells" do
      visit "/merchants/9"
      expect(page).to have_content("Hand-Spencer's Items")
    end
  end
end