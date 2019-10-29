module Cloverrb
  class Client
    BASE_URL = "https://api.clover.com/v3"
    AUTH_URL = "https://clover.com/oauth/token"

    attr_reader :token, :merchant_id, :order_id

    def initialize(params)
      @token = params[:token]
      @merchant_id = params[:merchant_id]
      @order_id = params[:order_id]
    end

    def get(token, path)
      HTTParty.get(BASE_URL + path, headers: build_headers(token)).parsed_response
    end

    def post(token, path, body)
      HTTParty.post(
        BASE_URL + path,
        headers: build_headers(token),
        query: body
      ).parsed_response
    end

    def put(token, path, body)
      HTTParty.put(
        BASE_URL + path,
        headers: build_headers(token),
        query: body
      ).parsed_response
    end

    def self.generate_access_token(client_id, code, app_secret)
      query = build_query(client_id, code, app_secret)
      HTTParty.get(AUTH_URL, query: query)
    end

    def all(role=nil)
      raise NotImplementedError
    end

    def find(id=nil)
      raise NotImplementedError
    end

    private

    def build_headers(token)
      { "Authorization" => "Bearer #{token}"}
    end 

    def self.build_query(client_id, code, app_secret)
      {
        "client_id" => client_id,
        "client_secret" => app_secret,
        "code" => code
      }
    end 
  end
end