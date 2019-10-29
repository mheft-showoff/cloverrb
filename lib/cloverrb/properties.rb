module Cloverrb
  class Properties < Client

    def fetch
      url = "/merchants/#{@merchant_id}/properties"
      get(@token, url)
    end
  end
end