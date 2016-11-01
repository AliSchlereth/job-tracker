require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new(city: "Denver")
        expect(company).to be_invalid
      end

      it "is invalid without a city" do
        company = Company.new(name: "Ericsson")
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox", city: "Denver")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name and city" do
        company = Company.new(name: "Dropbox", city: "Denver")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox", city: "Denver")
      expect(company).to respond_to(:jobs)
    end
  end

  describe "company methods" do
    scenario "sort companies by average interest" do
      company1 = Company.create!(name: "Company1", city: "Denver")
      job1 = company1.jobs.create(title: "Job1", description: "Do a job", level_of_interest: 10)
      job2 = company1.jobs.create(title: "Job2", description: "All the things", level_of_interest: 20)

      company2 = Company.create!(name: "Company2", city: "Denver")
      job3 = company2.jobs.create(title: "Job3", description: "Do a job", level_of_interest: 20)
      job4 = company2.jobs.create(title: "Job4", description: "All the things", level_of_interest: 30)

      company3 = Company.create!(name: "Company3", city: "Denver")
      job5 = company3.jobs.create(title: "Job5", description: "Do a job", level_of_interest: 30)
      job6 = company3.jobs.create(title: "Job6", description: "All the things", level_of_interest: 40)

      top_3 = Company.top_three_companies_by_interest
      expected = [["Company3", 35.0], ["Company2", 25.0], ["Company1", 15.0]]

      expect(top_3).to eq(expected)
    end

    scenario "they totals of companies by location" do
      company1 = Company.create!(name: "Company1", city: "Denver")
      job1 = company1.jobs.create(title: "Job1", description: "Do a job", level_of_interest: 10)
      job2 = company1.jobs.create(title: "Job2", description: "All the things", level_of_interest: 20)

      company2 = Company.create!(name: "Company2", city: "Denver")
      job3 = company2.jobs.create(title: "Job3", description: "Do a job", level_of_interest: 20)
      job4 = company2.jobs.create(title: "Job4", description: "All the things", level_of_interest: 30)

      company3 = Company.create!(name: "Company3", city: "Chicago")
      job5 = company3.jobs.create(title: "Job5", description: "Do a job", level_of_interest: 30)
      job6 = company3.jobs.create(title: "Job6", description: "All the things", level_of_interest: 40)

      count = Company.count_by_location

      expect(count).to eq([["Denver", 4], ["Chicago", 2]])
    end
  end




end
