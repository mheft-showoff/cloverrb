module Cloverrb
  class Employee < Client

    def all(role=nil)
      url = "/merchants/#{@merchant_id}/employees"
      url += "?filter=role=#{role}" if role
      get(@token, url)
    end

    def find(employee_id)
      url = "/merchants/#{@merchant_id}/employees/#{employee_id}"
      get(@token, url)
    end
  end
end