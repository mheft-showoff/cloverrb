module Cloverrb
  class ModifierGroup < Client

    def all(role=nil)
      url = "/merchants/#{@merchant_id}/modifier_groups"
      url += "?filter=role=#{role}" if role
      get(@token, url)
    end

    def find(id)
      url = "/merchants/#{@merchant_id}/modifier_groups/#{id}"
      get(@token, url)
    end
  end
end