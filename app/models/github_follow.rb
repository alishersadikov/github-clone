class GithubFollow
  attr_reader :id, :type, :repo, :actor, :payload

  def initialize(attributes = {})
    @id = attributes[:id]
    @type = attributes[:type]
    @actor = attributes[:actor]
    @repo = attributes[:repo]
    @repo = attributes[:payload]
  end

  def self.for_user(token)

    raw_follows = GithubService.new(token).follows.map do |raw_follow|
      GithubFollow.new(raw_follow)
    end
  end
end
