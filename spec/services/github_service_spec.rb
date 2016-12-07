require 'rails_helper'

describe GithubService do
  # VCR.use_cassette("synopsis") do
  #   response = Net::HTTP.get_response(URI('http://www.iana.org/domains/reserved'))
  #   assert_match /Example domains/, response.body
  # end

  context "#repositories" do
    it "returns all repositories for a user" do
      VCR.use_cassette("#repos") do
        repos = GithubService.new(ENV["new_token"]).repos
        repo = repos.first

        expect(repos).to be_an(Array)
        expect(repo).to have_key(:name)
        expect(repo).to have_key(:full_name)
        expect(repo).to have_key(:description)
      end
    end
  end
end
