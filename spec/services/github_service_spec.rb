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
    it "returns all repositories for a user" do
      VCR.use_cassette("#profile") do
        profile = GithubService.new(ENV["token"]).profile

        expect(profile).to be_an(Hash)
        expect(profile).to have_key(:login)
        expect(profile).to have_key(:avatar_url)
        expect(profile).to have_key(:followers)
        expect(profile).to have_key(:following)
        expect(profile).to have_key(:public_repos)
      end
    end
  end
end
