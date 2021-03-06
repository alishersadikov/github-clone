require 'rails_helper'
require 'capybara/rspec'

describe "user logs in" do
  it "using github credentials" do
    VCR.use_cassette(".login") do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        provider: 'github',
        uid: '18390711',
        credentials: { token: ENV['token'] },
        info: { nickname: 'alishersadikov'}
      })

      visit root_path

      expect(page).to have_link("Login with Github")
      click_link "Login with Github"

      expect(page).to have_content('alishersadikov')
    end
  end
end
