require 'rails_helper'

describe GithubProfile do
  context ".for_user(token)" do
    it "returns profile info for a user" do
      VCR.use_cassette("profile/.for_user") do
        profile = GithubProfile.for_user(ENV["token"])

        expect(profile).to be_an(GithubProfile)
        expect(profile).to respond_to(:name)
        expect(profile).to respond_to(:full_name)
        expect(profile).to respond_to(:avatar_url)
        expect(profile).to respond_to(:followers)
        expect(profile).to respond_to(:following)
      end
    end
  end
end
