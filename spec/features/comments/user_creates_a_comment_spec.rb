require 'rails_helper'

describe "User creates a comment" do
  scenario "they can add a comment to a job" do
    company = Company.create(name: "Company 1", city: "Denver")
    job = company.jobs.create(title: "Job1", level_of_interest: 50)

    visit company_job_path(company, job)
    fill_in "comment[note]", with: "This is a comment"
    click_on "Create Comment"

    expect(page).to have_content "This is a comment"
    expect(current_path).to eq(company_job_path(company, job))
  end

  

end
