require 'rails_helper'

describe Category do
  describe "Validations" do
      it "is invalid without a title" do
        category = Category.new()

        expect(category).to be_invalid
      end

      it "is valid with a title" do
        category = Category.create!(title: "Red")

        expect(category).to be_valid
      end


  end
end
