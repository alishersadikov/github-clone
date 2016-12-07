class GithubService
  def initialize(token)
    @token = token
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params[:access_token] = token
    end
  end

  def repos
    response = conn.get "/user/repos"
    parse(response.body)
  end

  def profile
    response = conn.get "/user"
    parse(response.body)
  end

  private
    attr_reader :token, :conn

    def parse(body)
      JSON.parse(body, symbolize_names: true)
    end
end
