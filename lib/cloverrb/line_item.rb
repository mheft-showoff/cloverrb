module Cloverrb
  class LineItem < Client

    def all
      url = "/merchants/#{@merchant}/orders/#{@order_id}/line_items"
      get(@token, url)
    end
  end
end