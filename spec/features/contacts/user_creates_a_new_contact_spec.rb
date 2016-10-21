require 'rails_helper'

describe "User creates a contact" do
  scenario "they create a contact from the job index" do
    company = Company.create(name: "ESPN", city: "LA")
    company.jobs.create(title: "Developer", level_of_interest: 70)

    visit company_jobs_path(company)
    fill_in "contact[full_name]", with: "Lady Name"
    fill_in "contact[email]", with: "name@email.com"
    fill_in "contact[position]", with: "Job Title"
    click_on "Create Contact"

    expect(page).to have_content"Lady Name"
  end

  scenario "they submit a new contact and are redirected to updated company page" do
    company = Company.create(name: "ESPN", city: "LA")
    company.jobs.create(title: "Developer", level_of_interest: 70)

    visit company_jobs_path(company)
    fill_in "contact[full_name]", with: "Lady Name"
    fill_in "contact[email]", with: "name@email.com"
    fill_in "contact[position]", with: "Job Title"
    click_on "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
  end


end
