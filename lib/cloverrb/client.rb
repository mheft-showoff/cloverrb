module Cloverrb
  class Client
    # BASE_URL = "https://api.clover.com/v3"
    AUTH_URL = "https://clover.com/oauth/token"

    attr_reader :token, :merchant_id, :order_id, :base_url

    def initialize(params)
      @token = params[:token]
      @merchant_id = params[:merchant_id]
      @order_id = params[:order_id]
      @base_url = set_base_url(params[:sandbox])
    end

    def get(token, path)
      HTTParty.get(base_url + path, headers: build_headers(token)).parsed_response.deep_symbolize_keys!
    end

    def post(token, path, body)
      HTTParty.post(
        base_url + path,
        headers: build_headers(token),
        query: body
      ).parsed_response.deep_symbolize_keys!
    end

    def put(token, path, body)
      HTTParty.put(
        base_url + path,
        headers: build_headers(token),
        query: body
      ).parsed_response.deep_symbolize_keys!
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

    def set_base_url(sandbox)
      sandbox ? "https://apisandbox.dev.clover.com/v3" : "https://api.clover.com/v3"
    end

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