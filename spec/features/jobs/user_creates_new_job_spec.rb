require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create(name: "ESPN", city: "NYC")
    category = Category.create(title: "Red")

    visit new_company_job_path(company)
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    select "#{category.title}", from: "job_category_id"

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("#{category.title}")
  end

  # scenario "attach a category to a new job" do
  #   company = Company.create(name: "ESPN", city: "NYC")
  #   category = Category.create(title: "Red")
  #
  #   visit new_company_job_path(company)
  #   save_and_open_page
  #   fill_in "job[title]", with: "Developer"
  #   fill_in "job[description]", with: "So fun!"
  #   fill_in "job[level_of_interest]", with: 80
  #   select "#{category.title}", from: "categorySelect"
  #
  # end

  scenario "user sees a link to create new category" do
    company = Company.create(name: "ESPN", city: "NYC")
    category = Category.create(title: "Red")

    visit new_company_job_path(company)

    expect(page).to have_content "Create Category"
  end

  scenario "user clicks create new category takes to new category page" do
    company = Company.create(name: "ESPN", city: "NYC")
    category = Category.create(title: "Red")

    visit new_company_job_path(company)
    click_on "Create Category"

    expect(current_path).to eq(new_category_path)
  end
end
