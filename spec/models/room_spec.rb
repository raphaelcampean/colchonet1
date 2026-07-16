require "rails_helper"

RSpec.describe Room, type: :model do
  describe "associations" do
    it "is invalid without a user" do
      room = Room.new(title: "Test Room", location: "Test Location", description: "Test Description", slug: "test-room")

      room.valid?
      expect(room.errors[:user]).to include("must exist")
    end

    it "is valid with a user" do
      user = User.create(email: "test@example.com", slug: "test-user", password: "password", location: "Test Location", full_name: "Test User", bio: "Test Bio needs to have at least 30 characters")
      room = Room.new(title: "Test Room", location: "Test Location", description: "Test Description", slug: "test-room", user: user)
      room.valid?
      expect(room.errors[:user]).not_to include("must exist")
    end
  end
end


RSpec.describe User, type: :model do
  describe "validations" do 
    it "is valid with valid attributes" do
      user = User.new(email: "test@example.com", name: "Test User")
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      user = User.new(name: "Test User")
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a name" do
      user = User.new(email: "test@example.com")
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end
  end
end
