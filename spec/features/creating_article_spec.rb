require 'rails_helper'

RSpec.feature "Creating Articles" do
  scenario "A user creates a new article" do
    visit "/"  # "/" means visit root

    click_link "New Article"

    fill_in "Title", with: "Creating a blog"
    fill_in "Body", with: "Lorem Ipsum"

    click_button "Create Article"

    # the are expectation of what we want to happen
    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
  end
end
