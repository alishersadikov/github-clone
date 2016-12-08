class DashboardController < ApplicationController
  def index
    @profile = GithubProfile.for_user(current_user.token)
  end
end
