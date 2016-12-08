class GithubRepo
  attr_reader :name, :full_name, :description

  def initialize(attributes = {})
    # attributes[:owner][:starred_url]

    @name = attributes[:name]
    @full_name = attributes[:full_name]
    @description = attributes[:description]
  end

  def self.for_user(token)
    repos = GithubService.new(token).repos.map do |raw_repo|
      GithubRepo.new(raw_repo)
    end
  end
end
