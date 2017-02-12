require 'rails_helper'

RSpec.feature "Listing Articles" do

# Create branch
# Create 2 articles to display

# list the two articles

# expect each artilces titles and bodies to be present

  before do
    @article1 = Article.create(title: "The first article", body: "Body of first article")

    @article2 = Article.create(title: "The second article", body: "Body of second artilce")
  end

  scenario "A user lists all articles" do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)

    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)

    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end

end
