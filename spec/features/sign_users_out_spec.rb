require 'rails_helper'

RSpec.feature "Signed out signed-in users" do
  before do
    # create user
    @john = User.create!(email: "john@example.com", password: "password")

    # sign in user
    visit "/"
    click_link  "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
  end

  scenario do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
    expect(page).not_to have_content("Sign out")
  end

end
