require 'rails_helper'

describe "User sees all jobs sorted by interest" do
  scenario "they see all the jobs" do
    company = Company.create!(name: "Company3", city: "Chicago")
    job1 = company.jobs.create(title: "Job1", level_of_interest: 70, description: "Wahooo Yeah")
    job2 = company.jobs.create(title: "Job2", level_of_interest: 75, description: "Best")
    job3 = company.jobs.create(title: "Job3", level_of_interest: 30, description: "Bad Culture")

    visit "/jobs?sort=interest"

    expect(page.body.index(job3.title)).to be < page.body.index(job2.title)
    expect(page.body.index(job3.title)).to be < page.body.index(job1.title)
    expect(page.body.index(job1.title)).to be < page.body.index(job2.title)

    # expect(page.body.index(company3.name)).to be < page.body.index(company2.name)

  end
end
