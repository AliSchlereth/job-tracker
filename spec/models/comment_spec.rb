require 'rails_helper'

describe Comment do
  describe "Validations" do
    it "is invalid without a notes" do
      comment = Comment.new()

      expect(comment).to_not be_valid
    end

    it "is valid with a notes" do
      comment = Comment.new(note: "This is a note.")

      expect(comment).to be_valid
    end
  end
end
