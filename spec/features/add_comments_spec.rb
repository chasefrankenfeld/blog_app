require "rails_helper"

RSpec.feature "Adding Comments to Articles" do

  before do
    @john  = User.create(email: "john@example.com", password: "password", password_confirmation: "password")
    @fred  = User.create(email: "fred@example.com", password: "password", password_confirmation: "password")
    @article = Article.create(title: "Title One", body: "Body of article one", user: @john)
  end

  scenario "permits signed in user to comment on an article" do
    login_as(@fred)

    visit "/"

    click_link @article.title

    fill_in "New Comment", with: "An amazing article."
    click_button "Add Comment"

    expect(page).to have_content("Comment has been created.")
    expect(page).to have_content("An amazing article.")
    expect(current_path).to eq(article_path(@article.id))
  end


end
