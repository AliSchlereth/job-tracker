require 'rails_helper'

describe "User visits a category page" do
  scenario "they see the category title" do
    category = Category.create!(title: "Red")

    visit category_path(category)

    expect(page).to have_content "Red"
  end
end
