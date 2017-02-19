require 'rails_helper'

RSpec.feature "Deleting an Article" do

  before do
    john  = User.create(email: "john@example.com", password: "password", password_confirmation: "password")
    login_as(john)
    @article = Article.create(title: "Title One", body: "Body of article one", user: john)
  end

  scenario "a user deletes an article" do
    visit "/"

    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(root_path)
  end

end
