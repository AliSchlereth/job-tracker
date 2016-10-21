require 'rails_helper'

describe Comment do
  describe "Validations" do
    it "is invalid without a notes" do
      comment = Comment.new()

      expect(comment).to_not be_valid
    end
  end
end
