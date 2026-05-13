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

RSpec.describe Calculator do
  describe ".sum" do
    it "returns the sum of two numbers" do
      expect(Calculator.sum(2, 3)).to eq(5)
    end
  end

  describe ".even?" do
    it "returns true for even numbers" do
      expect(Calculator.even?(4)).to eq(true)
    end

    it "returns false for odd numbers" do
      expect(Calculator.even?(5)).to eq(false)
    end
  end

  describe "#multiply" do
    let (:calculator) { Calculator.new }
    it "returns the product of two numbers" do
      expect(calculator.multiply(2, 3)).to eq(6)
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

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:body) }

  it { should belong_to(:user) }
end