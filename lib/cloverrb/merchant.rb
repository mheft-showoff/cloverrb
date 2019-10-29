module Cloverrb
  class Merchant < Client

    def find(merchant_id)
      url = "/merchants/#{merchant_id}?expand=owner"
      get(@token, url) 
    end
  end
end