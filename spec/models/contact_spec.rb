require 'rails_helper'

describe Contact do
  describe "Validations" do
    it "is invalid without a full_name" do
      contact = Contact.new(email: "name@email.com", position: "Manager")

      expect(contact).to_not be_valid
    end

    it "is invalid without an email" do
      contact = Contact.new(full_name: "Sandra", position: "Manager", position: "Manager")

      expect(contact).to_not be_valid
    end

    it "is invalid without a position" do
      contact = Contact.new(full_name: "Sandra", email: "name@email.com")

      expect(contact).to_not be_valid
    end

    it "is valid with a name, email and position" do
      contact = Contact.new(full_name: "Sandra", email: "name@email.com", position: "Manager" )

      expect(contact).to be_valid
    end
  end

end
