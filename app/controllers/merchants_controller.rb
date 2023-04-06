class MerchantsController < ApplicationController
  def index
    @merchants = RailsEngineFacade.new.all_merchants
  end

  def show
    @merchant = RailsEngineFacade.new.merchant_by_id(params[:id])
    @merchant_items = RailsEngineFacade.new.merchant_items(params[:id])
  end
end