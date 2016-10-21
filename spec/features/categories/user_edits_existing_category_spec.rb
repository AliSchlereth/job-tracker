require 'rails_helper'

describe "User edits an existing category" do
  scenario "they edit the category title" do
    category = Category.create!(title: "Red")

    visit edit_category_path(category)
    fill_in "category[title]", with: "Green"
    click_on "Update Category"

    expect(page).to have_content "Green"
    expect(page).to_not have_content "Red"
    expect(current_path).to eq(categories_path)
  end
end
