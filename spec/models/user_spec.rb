require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "creates a new user" do
      @user = User.create(name: 'User', email: 'user@user.com', password: 'password', password_confirmation: 'password')
      expect(@user).to be_valid
    end

    it "should not create a new user when name value nil" do
      @user = User.create(name: nil, email: 'user@user.com', password: 'password', password_confirmation: 'password')
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "should not create a new user when email value nil" do
      @user = User.create(name: 'User', email: nil, password: 'password', password_confirmation: 'password')
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should not create a new user when password value nil" do
      @user = User.create(name: 'User', email: 'user@user.com', password: nil, password_confirmation: 'password')
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should not create a new user when password_confirmation value nil" do
      @user = User.create(name: 'User', email: 'user@user.com', password: 'password', password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "should not create a new user when passwords don't match" do
      @user = User.create(name: 'User', email: 'user@user.com', password: 'password', password_confirmation: 'assword')
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should not create a new user when email already exists" do
      @user = User.create(name: 'User', email: 'user@user.com', password: 'password', password_confirmation: 'password')
      @user1 = User.create(name: 'User', email: 'USER@user.com', password: 'password', password_confirmation: 'password')
      expect(@user1.errors.full_messages).to include("Email has already been taken")
    end

    it "should not create a new user when password length < 8 characters" do
      @user = User.create(name: 'User', email: 'user@user.com', password: 'assword', password_confirmation: 'assword')
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  
  end

  describe '.authenticate_with_credentials' do
    
    it "returns a user when authenticated" do
      @user = User.create(name: 'User', email: 'user@user.com', password: 'password', password_confirmation: 'password')
      authenticated_user = User.authenticate_with_credentials('user@user.com', 'password')
      expect(authenticated_user).to eq(@user)
    end

    it "returns nil when not authenticated" do
      @user = User.create(name: 'User', email: 'user@user.com', password: 'password', password_confirmation: 'password')
      authenticated_user = User.authenticate_with_credentials('user@user.com', 'assword')
      expect(authenticated_user).to eq(nil)
    end

    it "returns a user when authenticated with email that contains leading or trailing spaces" do
      @user = User.create(name: 'User', email: 'user@user.com', password: 'password', password_confirmation: 'password')
      authenticated_user = User.authenticate_with_credentials(' user@user.com ', 'password')
      expect(authenticated_user).to eq(@user)
    end

    it "returns a user when authenticated with email that is case insensitive" do
      @user = User.create(name: 'User', email: 'user@user.com', password: 'password', password_confirmation: 'password')
      authenticated_user = User.authenticate_with_credentials('UsEr@uSeR.COM', 'password')
      expect(authenticated_user).to eq(@user)
    end

  end

end
