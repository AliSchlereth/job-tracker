require 'rails_helper'

feature "User deletes existing job" do
  scenario "they delete the current job" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70)

    visit company_jobs_path(company)

    within(".job_#{job.id}") do
      click_on "Delete"
    end

    expect(page).to_not have_content "Developer"
  end
end
