class DashboardController < ApplicationController
  def index
    @profile = DisplayProfile.new(current_user)
  end

  # def show
  #   @profile = DisplayProfile.new(current_user).repos
  # end
end
