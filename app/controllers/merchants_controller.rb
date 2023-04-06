class MerchantsController < ApplicationController
  def index
    response = Faraday.get("http://localhost:3000/api/v1/merchants")
    @merchants = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def show
    merchant_response = Faraday.get("http://localhost:3000/api/v1/merchants/#{params[:id]}")
    @merchant = JSON.parse(merchant_response.body, symbolize_names: true)[:data]
    merchant_items_response = Faraday.get("http://localhost:3000/api/v1/merchants/#{params[:id]}/items")
    @merchant_items = JSON.parse(merchant_items_response.body, symbolize_names: true)[:data]
    require 'pry'; binding.pry
  end
end