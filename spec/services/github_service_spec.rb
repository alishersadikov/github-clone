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

  context "#organizations" do
    it "returns all organizations a user is a member of" do
      VCR.use_cassette("#organizations") do
        user = User.create(uid: 1, username: "alishersadikov", token: ENV["token"])
        organizations = GithubService.new(ENV["token"]).organizations
        organization = organizations.first

        expect(organizations).to be_an(Array)
        expect(organization).to have_key(:id)
        expect(organization).to have_key(:login)
        expect(organization).to have_key(:members_url)
        expect(organization).to have_key(:avatar_url)
        expect(organization).to have_key(:description)
      end
    end
  end

  context "#starred_repos" do
    it "returns all starred_repos for a user" do
      VCR.use_cassette("#starred_repos") do
        user = User.create(uid: 1, username: "alishersadikov", token: ENV["token"])
        starred_repos = GithubService.new(ENV["token"]).starred_repos
        starred_repo = starred_repos.first

        expect(starred_repos).to be_an(Array)
        expect(starred_repo).to have_key(:id)
        expect(starred_repo).to have_key(:name)
        expect(starred_repo).to have_key(:full_name)
        expect(starred_repo).to have_key(:owner)
      end
    end
  end

  context "#create_repo" do
    it "sends a post request to create a repo" do
      VCR.use_cassette("#create_repo") do
        user = User.create(uid: 1, username: "alishersadikov", token: ENV["token"])
        created_repo = GithubService.new(ENV["token"]).create_repo("new_name")

        expect(created_repo).to have_key(:id)
        expect(created_repo[:name]).to eq("new_name")
        expect(created_repo[:full_name]).to eq("#{user.username}/new_name")
        expect(created_repo).to have_key(:owner)
      end
    end
  end
end
