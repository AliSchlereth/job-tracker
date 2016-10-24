require 'rails_helper'

describe "User sees all companies by location" do
  scenario "they see companies grouped by location" do
    company1 = Company.create!(name: "Company1", city: "Denver")
    job1 = company1.jobs.create(title: "Job1", description: "Do a job", level_of_interest: 10)
    job2 = company1.jobs.create(title: "Job2", description: "All the things", level_of_interest: 20)

    company2 = Company.create!(name: "Company2", city: "Denver")
    job3 = company2.jobs.create(title: "Job3", description: "Do a job", level_of_interest: 20)
    job4 = company2.jobs.create(title: "Job4", description: "All the things", level_of_interest: 30)

    company3 = Company.create!(name: "Company3", city: "Chicago")
    job5 = company3.jobs.create(title: "Job5", description: "Do a job", level_of_interest: 30)
    job6 = company3.jobs.create(title: "Job6", description: "All the things", level_of_interest: 40)

    company4 = Company.create!(name: "Company4", city: "Anaheim")
    job7 = company4.jobs.create(title: "Job5", description: "Do a job", level_of_interest: 30)
    job8 = company4.jobs.create(title: "Job6", description: "All the things", level_of_interest: 40)


    visit "/companies?sort=location"

    expect(page.body.index(company3.name)).to be < page.body.index(company2.name)
    expect(page.body.index(company4.name)).to be < page.body.index(company3.name)
  end


end
