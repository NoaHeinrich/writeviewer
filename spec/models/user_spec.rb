require 'rails_helper'

describe User do
  before(:each) do
    @user = User.new(username: "tester", email: "test@test.com", password: "password")
  end

  let(:user) { User.new }
  describe "#new" do
    it "creates a valid user object" do
      expect(@user.valid?).to be true
    end

    it "recognizes an invalid email" do
      user = User.new(username: "test", email: "test", password: "password")
      expect(user.valid?).to be false
    end
  end
end