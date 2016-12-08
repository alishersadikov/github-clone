require 'rails_helper'

describe GithubEvent do
  context ".for_user(token)" do
    it "returns events for a user" do
      VCR.use_cassette("event/.for_user") do
        events = GithubEvent.for_user(ENV["token"])
        event = events.first

        expect(events).to be_an(Array)
        expect(event).to be_an(GithubEvent)
        expect(event).to respond_to(:id)
        expect(event).to respond_to(:type)
        expect(event).to respond_to(:actor)
        expect(event).to respond_to(:repo)
      end
    end
  end
end
