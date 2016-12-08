require 'rails_helper'

describe GithubService do
  context "#repos" do
    it "returns all repositories for a user" do
      VCR.use_cassette("#repos") do
        repos = GithubService.new(ENV["token"]).repos
        repo = repos.first

        expect(repos).to be_an(Array)
        expect(repo).to have_key(:name)
        expect(repo).to have_key(:full_name)
        expect(repo).to have_key(:description)
      end
    end
  end

  context "#profile" do
    it "returns profile info for a user" do
      VCR.use_cassette("#profile") do
        profile = GithubService.new(ENV["token"]).profile

        expect(profile).to have_key(:login)
        expect(profile).to have_key(:avatar_url)
        expect(profile).to have_key(:followers)
        expect(profile).to have_key(:following)
        expect(profile).to have_key(:public_repos)
      end
    end
  end

  context "#events" do
    it "returns all events for a user" do
      VCR.use_cassette("#events") do
        events = GithubService.new(ENV["token"]).events
        event = events.first

        expect(events).to be_an(Array)
        expect(event).to have_key(:id)
        expect(event).to have_key(:type)
        expect(event).to have_key(:actor)
        expect(event).to have_key(:repo)
      end
    end
  end

  context "#follows" do
    it "returns all events for users followed by a user" do
      VCR.use_cassette("#follows") do
        user = User.create(uid: 1, username: "alishersadikov", token: ENV["token"])
        follows = GithubService.new(ENV["token"]).follows
        follow = follows.first

        expect(follows).to be_an(Array)
        expect(follow).to have_key(:id)
        expect(follow).to have_key(:type)
        expect(follow).to have_key(:actor)
        expect(follow).to have_key(:repo)
        expect(follow).to have_key(:payload)
      end
    end
  end
end
