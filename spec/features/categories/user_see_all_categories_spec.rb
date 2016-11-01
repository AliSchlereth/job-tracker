require 'rails_helper'

describe "User sees all current categories" do
  scenario "they vist the index" do
    category = Category.create!(title: "Red")
    category = Category.create!(title: "Green")

    visit categories_path

    expect(page).to have_content "Red"
    expect(page).to have_content "Green"
  end

  scenario "they click on a specific category title" do
    category1 = Category.create!(title: "Red")
    category2 = Category.create!(title: "Green")

    visit categories_path
    click_link "Red"

    expect(current_path).to eq(category_path(category1))
  end

  scenario "they click on delete for a category" do
    category = Category.create!(title: "Red")

    visit categories_path

    within(".category_#{category.id}") do
      click_on "Delete"
    end

    expect(current_path).to eq(categories_path)
  end

  scenario "they click on edit for a category" do
    category = Category.create!(title: "Red")

    visit categories_path
    within(".category_#{category.id}") do
      click_on "Edit"
    end
    
    expect(current_path).to eq(edit_category_path(category))
  end


end
