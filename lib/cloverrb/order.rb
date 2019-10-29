module Cloverrb
  class Order < Client

    def all(merchant_id, options = {})
      url = "/merchants/#{merchant_id}/orders?"

      filters = []
      filters << "filter=createdTime>=#{options[:start_date]}" if has_start_date?(options)
      filters << "filter=createdTime<=#{options[:end_date]}" if has_end_date?(options)
      filters << "filter=state=#{options[:state]}" if has_state?(options)
      url += filters.join("&")

      get(@token, url)
    end

    def self.total(line_items)
      items = line_items["elements"]
      items.inject(0) { |sum, item| sum + item["price"] }
    end

    def has_start_date?(options)
      options[:start_date]
    end

    def has_end_date?(options)
      options[:end_date]
    end

    def has_state?(options)
      options[:state]
    end
  end
end