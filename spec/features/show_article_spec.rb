require 'rails_helper'
RSpec.feature "Show article"  do
	before do
		@article = Article.create(title: "The first article", body: "blah,blah")
	end

	scenario "A User see article details" do
		visit "/"
		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))
	end
end

