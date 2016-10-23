require 'rails_helper'

describe "User sees dashboard components" do
  scenario "they see a count of all jobs by level of interest" do
    company = Company.create!(name: "Company1", city: "Denver")
    job1 = company.jobs.create(title: "Job1", description: "Do a job", level_of_interest: 10)
    job2 = company.jobs.create(title: "Job2", description: "All the things", level_of_interest: 10)
    job3 = company.jobs.create(title: "Job3", description: "Love the job", level_of_interest: 90)

    visit dashboard_index_path

    expect(page).to have_content ("Interest: 90 Count: 1")
    expect(page).to have_content ("Interest: 10 Count: 2")
  end
end
