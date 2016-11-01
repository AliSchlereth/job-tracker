require 'rails_helper'

describe "User deletes a category" do
  scenario "they no longer see the deleted category" do
    category1 = Category.create(title: "Red")
    category2 = Category.create(title: "Green")


    visit categories_path

    within(".category_#{category1.id}") do
      click_on "Delete"
    end

    expect(page).to_not have_content "Red"
  end
end
