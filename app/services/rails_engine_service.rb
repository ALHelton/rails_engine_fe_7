class RailsEngineService
  def connection
    Faraday.new(url: "http://localhost:3000/")
  end

  def get_url(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def get_all_merchants
    get_url("api/v1/merchants")
  end

  def get_merchant(merchant_id)
    get_url("api/v1/merchants/#{merchant_id}")
  end

  def get_merchant_items(merchant_id)
    get_url("api/v1/merchants/#{merchant_id}/items")
  end
end