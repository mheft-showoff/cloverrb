module Cloverrb
  class Item < Client

    def all(role=nil)
      url = "/merchants/#{@merchant_id}/items?expand=tags%2Ccategories"
      get(@token, url)
    end

    def find(id)
      url = "/merchants/#{@merchant_id}/items/#{id}?expand=tags%2Ccategories"
      get(@token, url)
    end

  end
end