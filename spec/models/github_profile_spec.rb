require 'rails_helper'

describe GithubProfile do
  context ".for_user(token)" do
    it "returns profile info for a user" do
      VCR.use_cassette("profile/.for_user") do
        profile = GithubProfile.for_user(ENV["token"])
        binding.pry
        expect(profile).to be_an(Array)
        expect(profile).to be_an(GithubRepo)
        expect(profile).to respond_to(:name)
        expect(profile).to respond_to(:full_name)
        expect(profile).to respond_to(:description)
      end
    end
  end
end
