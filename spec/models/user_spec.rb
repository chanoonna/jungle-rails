require 'rails_helper'

RSpec.describe User, type: :model do

   describe 'Validations' do
    before do
      @user = User.new(
        password: 'password',
        password_confirmation: 'password',
        email: 'test@test.com',
        firstname: 'John',
        lastname: 'Doe'
      )
    end

    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without a password' do
      @user.password = nil
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid with a password that has length shorter than 4' do
      @user.password = 'abc'
      @user.password_confirmation = 'abc'
      expect(@user).to_not be_valid
    end

    it 'is not valid to sign up with email that exists already' do
      @user.save
      @user2 = User.new(
        password: 'password',
        password_confirmation: 'password',
        email: 'test@test.com',
        firstname: 'John',
        lastname: 'Doe'
      )

      expect(@user2).to_not be_valid
    end

    it 'is not valid to sign up with email that exists even with difference cases' do
      @user.save
      @user2 = User.new(
        password: 'password',
        password_confirmation: 'password',
        email: 'TEST@test.com',
        firstname: 'John',
        lastname: 'Doe'
      )

      expect(@user2).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(
        password: 'password',
        password_confirmation: 'password',
        email: 'test@test.com',
        firstname: 'John',
        lastname: 'Doe'
      )
    end

    it 'should log in when correct credentials are given' do
      @login = User.authenticate_with_credentials 'test@test.com', 'password'

      expect(@login).to_not be_nil
    end

    it 'should not log in when the password is wrong' do
      @login = User.authenticate_with_credentials 'test@test.com', 'passwo'

      expect(@login).to be_nil
    end

    it 'should log in when email address has trailing spaced' do
      @login = User.authenticate_with_credentials '  test@test.com  ', 'password'

      expect(@login).to_not be_nil
    end

    it 'should log in when different cases used for the email address' do
      @login = User.authenticate_with_credentials 'TEST@test.com', 'password'

      expect(@login).to_not be_nil
    end
  end
end
