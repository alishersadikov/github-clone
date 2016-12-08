class GithubService
  def initialize(token)
    @_token = token
    @_conn = connection
    @_user = User.find_by(token: token)
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

  def organizations
    response = conn.get "user/orgs"
    parse(response.body)
  end

  def starred_repos
    response = conn.get "users/#{user.username}/starred"
    parse(response.body)
  end

  def create_repo(repo_name)
    response = conn.post do |req|
      req.url '/user/repos'
      req.headers['Content-Type'] = 'application/json'
      body = { name: repo_name }
      req.body = body.to_json
    end
    parse(response.body)
  end

  private

    def user
      @_user
    end

    def token
      @_token
    end

    def conn
      @_conn
    end

    def connection
      Faraday.new(url: "https://api.github.com") do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.params[:access_token] = token
      end
    end

    def parse(body)
      JSON.parse(body, symbolize_names: true)
    end
end
