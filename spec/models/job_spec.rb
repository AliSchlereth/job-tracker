require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo")
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title and level of interest" do
        job = Job.new(title: "Developer", level_of_interest: 40)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
  end

  describe "job methods" do
    it "sorts jobs by level of interest returns count" do
      job = Job.create(title: "Software1", level_of_interest: 70, description: "Wahooo")
      job = Job.create(title: "Software2", level_of_interest: 70, description: "Wahooo Yeah")
      job = Job.create(title: "Software3", level_of_interest: 75, description: "Best")
      job = Job.create(title: "Software4", level_of_interest: 30, description: "Bad Culture")

      sorted = Job.count_by_interest
      expected = {30=>1, 70=>2, 75=>1}

      expect(sorted).to eq(expected)
    end

    it "sorts jobs by level of interest" do
      job2 = Job.create(title: "Software2", level_of_interest: 70, description: "Wahooo Yeah")
      job3 = Job.create(title: "Software3", level_of_interest: 75, description: "Best")
      job4 = Job.create(title: "Software4", level_of_interest: 30, description: "Bad Culture")

      sorted = Job.sort_by_interest

      expect(sorted).to eq([job4, job2, job3])
    end
  end
end
