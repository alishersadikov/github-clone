class DisplayProfile
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def profile_info
    GithubProfile.for_user(user.token)
  end
end
