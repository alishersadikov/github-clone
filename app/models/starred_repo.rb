class StarredRepo
  attr_reader :id, :name, :full_name, :owner

  def initialize(attributes = {})
    @name = attributes[:name]
    @full_name = attributes[:full_name]
    @owner = attributes[:owner]
  end

  def self.for_user(token)
    repos = GithubService.new(token).starred_repos.map do |raw_repo|
      StarredRepo.new(raw_repo)
    end
  end
end
