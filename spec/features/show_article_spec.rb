# create branch
# create 1 article to display
# show the article title and details

require 'rails_helper'

RSpec.feature "Show Article" do

  before do
    @john  = User.create(email: "john@example.com", password: "password", password_confirmation: "password")
    @fred  = User.create(email: "fred@example.com", password: "password", password_confirmation: "password")
    @article = Article.create(title: "Title One", body: "Body of article one", user: @john)
  end

  scenario "to non-signed in user, hide Edit and Delete buttons" do
    visit "/"

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)

    expect(current_path).to eq(article_path(@article))  # This is how you compare paths

    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

  scenario "to non-owner, hide Edit and Delete buttons" do
    login_as(@fred)
    visit "/"

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)

    expect(current_path).to eq(article_path(@article))  # This is how you compare paths

    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

  scenario "to signed in user and owner, show Edit and Delete buttons" do
    login_as(@john)
    visit "/"

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)

    expect(current_path).to eq(article_path(@article))  # This is how you compare paths

    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
  end

end
