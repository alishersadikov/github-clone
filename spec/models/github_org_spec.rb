require 'rails_helper'

describe GithubOrg do
  context ".for_user(token)" do
    it "returns organizations a user follows" do
      VCR.use_cassette("organization/.for_user") do
        user = User.create(uid: 1, username: "alishersadikov", token: ENV["token"])
        organizations = GithubOrg.for_user(ENV["token"])
        organization = organizations.first

        expect(organizations).to be_an(Array)
        expect(organization).to be_an(GithubOrg)
        expect(organization).to respond_to(:id)
        expect(organization).to respond_to(:login)
        expect(organization).to respond_to(:members_url)
        expect(organization).to respond_to(:avatar_url)
        expect(organization).to respond_to(:description)
      end
    end
  end
end
