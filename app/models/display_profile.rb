class DisplayProfile
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def profile_info
    GithubProfile.for_user(user.token)
  end

  def repos
    GithubRepo.for_user(user.token)
  end

  def events
    GithubEvent.for_user(user.token)
  end

  def follows
    GithubFollow.for_user(user.token)
  end

  def orgs
    GithubOrg.for_user(user.token)
  end

  def starred_repos
    
  end

  def followers

  end

  def following

  end
end
