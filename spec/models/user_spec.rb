require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validation" do

    it "is valid with valid attributes" do
      @user = User.new(first_name: "Testy", last_name: "McTest", email:"a@a.com", password: "asdf", password_confirmation: "asdf")
      expect(@user).to be_valid
    end
    it "is not valid if password and password confirmation does not match " do
      @user = User.new(first_name: "Testy", last_name: "McTest", email:"a@a.com", password: "asdfa", password_confirmation: "asdfz")
      expect(@user).to_not be_valid
    end
    it "is not valid with no password or password confirmation" do
      @user = User.new(first_name: "Testy", last_name: "McTest", email:"a@a.com")
      expect(@user).to_not be_valid
    end
    it "is not valid with no email" do
      @user = User.new(first_name: "Testy", last_name: "McTest", password: "asdf", password_confirmation: "asdf")
      expect(@user).to_not be_valid
    end
    it "is not valid with no first name" do
      @user = User.new(last_name: "McTest", email:"a@a.com", password: "asdf", password_confirmation: "asdf")
      expect(@user).to_not be_valid
    end
    it "is not valid with no last name" do
      @user = User.new(first_name: "Testy", email:"a@a.com", password: "asdf", password_confirmation: "asdf")
      expect(@user).to_not be_valid
    end
    it "is not valid if the password is under the minimum length" do
      @user = User.new(first_name: "Testy", last_name: "McTest", email:"a@a.com", password: "asd", password_confirmation: "asdf")
      expect(@user).to_not be_valid
    end
    it "is not valid if the email is not unique" do
      @user1 = User.new(first_name: "Testy", last_name: "McTest", email:"a@a.com", password: "asdf", password_confirmation: "asdf")
      @user1.save
      @user2 = User.new(first_name: "Testy", last_name: "McTest", email:"a@a.com", password: "asdf", password_confirmation: "asdf")
      expect(@user2).to_not be_valid
    end

  end

  describe ".authenticate_with_credentials" do
    it "authenticates if credentials are correct" do
      @user = User.new(first_name: "Testy", last_name: "McTest", email:"a@a.com", password: "asdf", password_confirmation: "asdf")
      @user.save
      user = User.authenticate_with_credentials('A@A.com ', 'asdf')
      expect(user).to eq(@user)
    end

    it "does not authenticate if credentials are incorrect" do
      @user = User.new(first_name: "Testy", last_name: "McTest", email:"a@a.com", password: "asdf", password_confirmation: "asdf")
      @user.save
      user = User.authenticate_with_credentials('A@a.com ', 'asdfa')
      expect(user).to_not eq(@user)
    end

  end
  
end
