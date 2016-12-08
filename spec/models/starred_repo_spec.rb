require 'rails_helper'

describe StarredRepo do
  context ".for_user(token)" do
    it "returns repos for a user" do
      VCR.use_cassette("starred/.for_user") do
        user = User.create(uid: 1, username: "alishersadikov", token: ENV["token"])
        repos = StarredRepo.for_user(ENV["token"])
        repo = repos.first

        expect(repos).to be_an(Array)
        expect(repo).to be_an(StarredRepo)
        expect(repo).to respond_to(:name)
        expect(repo).to respond_to(:full_name)
        expect(repo).to respond_to(:owner)
      end
    end
  end
end
