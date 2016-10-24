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

  scenario "they see a list of top 3 companies by avg level of interest" do
    company1 = Company.create!(name: "Company1", city: "Denver")
    job1 = company1.jobs.create(title: "Job1", description: "Do a job", level_of_interest: 10)
    job2 = company1.jobs.create(title: "Job2", description: "All the things", level_of_interest: 20)

    company2 = Company.create!(name: "Company2", city: "Denver")
    job3 = company2.jobs.create(title: "Job3", description: "Do a job", level_of_interest: 20)
    job4 = company2.jobs.create(title: "Job4", description: "All the things", level_of_interest: 30)

    company3 = Company.create!(name: "Company3", city: "Denver")
    job5 = company2.jobs.create(title: "Job5", description: "Do a job", level_of_interest: 30)
    job6 = company2.jobs.create(title: "Job6", description: "All the things", level_of_interest: 40)

    visit dashboard_index_path

    expected = "Name: Company2 Average Interest: 30.0
                Name: Company1 Average Interest: 15.0"

    expect(page).to have_content (expected)
  end

  scenario "they can see a count of cities by location" do
    company1 = Company.create!(name: "Company1", city: "Denver")
    job1 = company1.jobs.create(title: "Job1", description: "Do a job", level_of_interest: 10)
    job2 = company1.jobs.create(title: "Job2", description: "All the things", level_of_interest: 20)

    company2 = Company.create!(name: "Company2", city: "Denver")
    job3 = company2.jobs.create(title: "Job3", description: "Do a job", level_of_interest: 20)
    job4 = company2.jobs.create(title: "Job4", description: "All the things", level_of_interest: 30)

    company3 = Company.create!(name: "Company3", city: "Chicago")
    job5 = company3.jobs.create(title: "Job5", description: "Do a job", level_of_interest: 30)
    job6 = company3.jobs.create(title: "Job6", description: "All the things", level_of_interest: 40)

    visit dashboard_index_path

    expect(page).to have_content "Denver 4 Jobs"
    expect(page).to have_content "Chicago 2 Jobs"
  end
end
