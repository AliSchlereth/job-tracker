require 'rails_helper'

describe "User visits a category page" do
  scenario "they see the category title" do
    category = Category.create!(title: "Red")

    visit category_path(category)

    expect(page).to have_content "Red"
  end

  scenario "User sees the jobs belonging to a category" do
    company = Company.create(name: "ESPN", city: "LA")
    category = Category.create!(title: "Blue")
    job = company.jobs.create(title: "Developer", level_of_interest: 70, category: category)

    visit category_path(category)

    expect(page).to have_content "Developer"
  end


end
