module Cloverrb
  class Label < Client

    def all(role=nil)
      url = "/merchants/#{@merchant_id}/labels"
      url += "?filter=role=#{role}" if role
      get(@token, url)
    end

    def find(id)
      url = "/merchants/#{@merchant_id}/labels/#{id}"
      get(@token, url)
    end
  end
end