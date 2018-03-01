require "rails_helper"

describe "a user goes to the homepage" do
  context "the user clicks on login with linkedin" do
    it "the user logs in with linkedin" do
      Capybara.app = JobMatch::Application

      omniauth_response

      visit "/"
      expect(page.status_code).to eq(200)

      page.first(".linkedin-login").click

      expect(current_path).to eq("/")

    end
  end
end
