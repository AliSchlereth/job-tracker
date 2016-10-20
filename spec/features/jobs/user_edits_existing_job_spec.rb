require 'rails_helper'

describe "User edits an existing entry" do
  scenario "user edits job name" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70)

    visit edit_company_job_path(company, job)
    fill_in "job[title]", with: "Software Developer"
    click_on "Update Job"

    expect(page).to have_content "Software Developer"
  end

  scenario "user edits a job location" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70)

    visit edit_company_job_path(company, job)
    fill_in "job[level_of_interest]", with: 80
    click_on "Update Job"

    expect(page).to have_content 80
  end
end
