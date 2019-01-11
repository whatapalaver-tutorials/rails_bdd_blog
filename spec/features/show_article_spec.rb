require 'rails_helper'

RSpec.feature 'Viewing individual Articles' do

  before do 
    @article1 = Article.create(title: "The first article", body: "Body of first article")
    @article2 = Article.create(title: "The second article", body: "Body of second article")
  end
  
  scenario "User selects an article to view" do
    visit '/'
    click_link @article1.title
    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_content(@article2.body)
    expect(current_path).to eq(article_path(@article1))

  end

end