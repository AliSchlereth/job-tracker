require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees all the companies" do
    company = Company.create(name: "ESPN", city: "LA")
    company_two = Company.create(name: "Disney", city: "LA")

    visit companies_path

    expect(page).to have_content("ESPN")
    expect(page).to have_content("LA")
  end

  scenario "a user clicks on link to edit" do
    company = Company.create(name: "ESPN", city: "LA")
    company_two = Company.create(name: "Disney", city: "LA")

    visit companies_path

    within(".company_#{company.id}") do
      click_on "Edit"

      expect(page).to have_content "#{company.name}"
    end
  end

  scenario "user clicks on link to delete" do
    company = Company.create(name: "ESPN", city: "LA")
    company_two = Company.create(name: "Disney", city: "LA")

    visit companies_path

    within(".company_#{company.id}") do
      click_on "Delete"

      expect(page).to_not have_css (".company_#{company.name}")
    end
  end

  scenario "user clicks on link to create new company" do
    visit companies_path
    click_on "Create Company"

    expect(page).to have_content "Create a new company here!"
  end

end
