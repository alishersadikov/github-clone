class GithubProfile

  def initialize(attributes = {})
    binding.pry
  end

  def self.for_user(token)
    raw_profile = GithubService.new(token).profile
    GithubRepo.new(raw_profile)
    end
  end
end
