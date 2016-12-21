require 'rails_helper'
RSpec.feature "Show article"  do
	before do
		john = User.create(email: "john@example.com", password: "password")
		login_as(john)
		@article = Article.create(title: "The first article", body: "blah,blah", user: john)
	end

	scenario "A User see article details" do
		visit "/"
		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))
	end
end

