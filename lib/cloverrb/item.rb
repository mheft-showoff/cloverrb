module Cloverrb
  class Item < Client

    def all(role=nil)
      url = "/merchants/#{@merchant_id}/items?expand=categories%2Ctags"
      url += "?filter=role=#{role}" if role
      get(@token, url)
    end

    def find(id)
      url = "/merchants/#{@merchant_id}/items/#{id}?expand=categories%2Ctags"
      get(@token, url)
    end

  end
end