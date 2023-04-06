class RailsEngineFacade
  attr_reader :service

  def initialize
    @service = RailsEngineService.new
  end

  def all_merchants
    json = service.get_all_merchants
    json.map do |data|
      Merchant.new(data)
    end
  end

  def merchant_by_id(merchant_id)
    data = service.get_merchant(merchant_id)
    Merchant.new(data)
  end

  def merchant_items(merchant_id)
    json = service.get_merchant_items(merchant_id)
    json.map do |data|
      Item.new(data)
    end
  end
end