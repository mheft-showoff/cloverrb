module Cloverrb
  class Address < Client

    def fetch
      url = "/merchants/#{@merchant_id}/address"
      get(@token, url)
    end
  end
end