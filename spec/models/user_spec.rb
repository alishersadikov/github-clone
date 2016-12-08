require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attributes" do
    let(:user) { User.new(uid: 1, username: "alishersadikov", token: ENV["token"]) }
    
    it "responds to uid" do
      expect(user).to respond_to(:uid)
    end

    it "responds to username" do
      expect(user).to respond_to(:username)
    end

    it "responds to token" do
      expect(user).to respond_to(:token)
    end
  end
end
