require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User validations" do
    describe "validates the presence of expected attributes" do
      it "positive result" do
        expect(User.new(username: 'username', email: 'email@test.com', password: 'password'))
          .to be_valid
      end

      it "negative result, missing attributes" do 
        expect(User.new(username: 'username')).to_not be_valid
      end
    end

    describe "validates that username is unique, and more then 3 characters" do
      it "negative result, username to short" do 
        expect(User.new(username: 'us', email: 'email@test.com', password: 'password'))
          .to_not be_valid
      end

      it "negative result, username is not unique" do 
        user1 = User.new(username: 'username', email: 'email@test.com', password: 'password')
        user1.save
        user2 = User.new(username: 'username', email: 'email2@test.com', password: 'password')
        result = user2.save
        expect(result).to be(false)
      end
    end

    describe "validates that emails is valid and unique" do
      it "negative result email is not valid" do
        expect(User.new(username: 'username', email: 'test.com', password: 'password'))
          .to_not be_valid
      end

      it "negative result email is not unique" do
        user1 = User.new(username: 'username', email: 'email@test.com', password: 'password')
        user1.save
        user2 = User.new(username: 'username2', email: 'email@test.com', password: 'password')
        result = user2.save
        expect(result).to be(false)
        expect(user2.errors[:email]).to eq(['has already been taken'])
      end
    end

  end

  describe "validates that password is of valid length - 6 characters" do
    it "negative result, password to short" do 
      expect(User.new(username: 'username', email: 'email@test.com', password: 'pass'))
        .to_not be_valid
    end
  end
end
