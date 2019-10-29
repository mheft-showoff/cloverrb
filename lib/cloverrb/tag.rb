module Cloverrb
  class Tag < Client

    def all(role=nil)
      url = "/merchants/#{@merchant_id}/tags"
      url += "?filter=role=#{role}" if role
      get(@token, url)
    end

    def find(id)
      url = "/merchants/#{@merchant_id}/tags/#{id}"
      get(@token, url)
    end
  end
end