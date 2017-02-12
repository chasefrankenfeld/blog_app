# create branch
# create 1 article to display
# show the article title and details

require 'rails_helper'

RSpec.feature "Show Article" do

  before do
    @article = Article.create(title: "The first article", body: "Body of first article")
  end

  scenario "Displaying the show page for an article" do
    visit "/"

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)

    expect(current_path).to eq(article_path(@article))  # This is how you compare paths
  end

end
