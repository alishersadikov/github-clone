class DashboardController < ApplicationController
  def index
    @profile = DisplayProfile.new(current_user)
  end
end
