# root_path
# click_link to article show page
# click_link edit button
# redirect_to edit_article_path(article)
# show the edit form
# Fill in title
# Fill in body
# Click submit button
# flash_message "article has been updated"

require 'rails_helper'

RSpec.feature "Edit an article" do

  before do
    john  = User.create(email: "john@example.com", password: "password", password_confirmation: "password")
    login_as(john)
    @article = Article.create(title: "Title One", body: "Body of article one", user: john)
  end

  scenario "A user updates an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: "Updated title"
    fill_in "Body", with: "Updated Body of Article"

    click_button "Update Article"

    expect(page).to have_content("Article has been updated")
    expect(current_path).to eq(article_path(@article))
  end

  scenario "A user fails to update an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: ""

    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(current_path).to eq(article_path(@article))
  end

end
