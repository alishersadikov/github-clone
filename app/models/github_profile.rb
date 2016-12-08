class GithubProfile
  attr_reader :name, :full_name, :avatar_url, :followers, :following

  def initialize(attributes = {})
    @name = attributes[:login]
    @full_name = attributes[:name]
    @avatar_url = attributes[:avatar_url]
    @followers = attributes[:followers]
    @following = attributes[:following]
  end

  def self.for_user(token)
    raw_profile = GithubService.new(token).profile
    GithubProfile.new(raw_profile)
  end
end
