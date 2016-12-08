require 'rails_helper'

describe GithubFollow do
  context ".for_user(token)" do
    it "returns events for users a user follows" do
      VCR.use_cassette("follow/.for_user") do
        user = User.create(uid: 1, username: "alishersadikov", token: ENV["token"])
        follows = GithubFollow.for_user(ENV["token"])
        follow = follows.first

        expect(follows).to be_an(Array)
        expect(follow).to be_an(GithubFollow)
        expect(follow).to respond_to(:id)
        expect(follow).to respond_to(:type)
        expect(follow).to respond_to(:actor)
        expect(follow).to respond_to(:repo)
        expect(follow).to respond_to(:payload)
      end
    end
  end
end
