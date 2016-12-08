class GithubOrg
  attr_reader :id, :login, :members_url, :avatar_url, :description

  def initialize(attributes = {})
    @id = attributes[:id]
    @login = attributes[:login]
    @members_url = attributes[:members_url]
    @avatar_url = attributes[:avatar_url]
    @description = attributes[:description]
  end

  def self.for_user(token)
    raw_orgs = GithubService.new(token).organizations.map do |raw_org|
      GithubOrg.new(raw_org)
    end
  end
end
