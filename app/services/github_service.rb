class GithubService
  def initialize(token)
    @_user = User.find_by(token: token)
    @_token = token
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

  def events
    response = conn.get "/events"
    parse(response.body)
  end

  def follows
    response = conn.get "users/#{user.username}/received_events"
    parse(response.body)
  end

  private
    attr_reader :conn
    def user
      @_user
    end

    def token
      @_token
    end

    def parse(body)
      JSON.parse(body, symbolize_names: true)
    end
end
