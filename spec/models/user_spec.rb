require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should be valid" do
      @user = User.new(
        first_name: 'Test',
        last_name: "Test",
        email: "test@test.com",
        password: "testtest",
        password_confirmation: "testtest"
      )
      expect(@user).to be_valid
    end

    it "password should be longer than 8 character" do 
      user = User.new
      user.first_name = 'Test',
      user.last_name = "Test",
      user.email = "test@test.com",
      user.password = "test",
      user.password_confirmation = "test"
      expect(user).to be_invalid
    end

    it "first name should not be less than 2 character" do 
      user = User.new
      user.first_name = 'T',
      user.last_name = "Test",
      user.email = "test@test.com",
      user.password = "test",
      user.password_confirmation = "test"
      expect(user).to be_invalid
    end

    it "last name should not be less than 2 character" do 
      user = User.new
      user.first_name = 'Test',
      user.last_name = "T",
      user.email = "test@test.com",
      user.password = "test",
      user.password_confirmation = "test"
      expect(user).to be_invalid
    end

    it "email should be unique" do
      user = User.new(
        first_name: 'Test1',
        last_name: "Test1",
        email: "test@test.com",
        password: "testtest",
        password_confirmation: "testtest"
      )
      user.save
      second_user = User.new(
        first_name: 'Test2',
        last_name: "Test2",
        email: "test@test.com",
        password: "testtest",
        password_confirmation: "testtest"
      )
      second_user.save

      expect(second_user.errors[:email]).to include('has already been taken')
    end

    it "first name can't be blank" do
      user = User.new(
        first_name: nil,
        last_name: "Test",
        email: "test@test.com",
        password: "testtest",
        password_confirmation: "testtest"
      )
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "last name can't be blank" do
      user = User.new(
        first_name: "Test",
        last_name: nil,
        email: "test@test.com",
        password: "testtest",
        password_confirmation: "testtest"
      )
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "email can't be blank" do
      user = User.new(
        first_name: "Test",
        last_name: "Test",
        email: nil,
        password: "testtest",
        password_confirmation: "testtest"
      )
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "password can't be blank" do
      user = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: nil,
        password_confirmation: nil
      )
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "password must match" do
      user = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "testtest",
        password_confirmation: "testtest1"
      )
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    
  end

    describe '.authenticate_with_credentials' do

      it "should be authenticated successfully with all capital Email address" do
        user = User.new(
          first_name: 'Test',
          last_name: "Test",
          email: "test@test.com",
          password: "testtest",
          password_confirmation: "testtest"
        )
        user.save
        user = User.authenticate_with_credentials('test@test.COM', 'testtest')
        expect(user).not_to be(nil)
      end 

      it "should be authenticated successfully with all capital Email address" do
        user = User.new(
          first_name: 'Test',
          last_name: "Test",
          email: "test@test.com",
          password: "testtest",
          password_confirmation: "testtest"
        )
        user.save
        user = User.authenticate_with_credentials('test@test.COM', 'testtest')
        expect(user).not_to be(nil)
      end 

      it "should be authenticated successfully with correct crendtials" do
        user = User.new(
          first_name: 'Test',
          last_name: "Test",
          email: "test@test.com",
          password: "testtest",
          password_confirmation: "testtest"
        )
        user.save
        user = User.authenticate_with_credentials('test@test.com', 'testtest')
        expect(user).not_to be(nil)
      end 

      it "should not be authenticated successfully with wrong crendtials" do
        user = User.new(
          first_name: 'Test',
          last_name: "Test",
          email: "test@test.com",
          password: "testtest",
          password_confirmation: "testtest"
        )
        user.save
        user = User.authenticate_with_credentials('test@123.com', 'testtest')
        expect(user).to be(nil)
      end

      it "should be authenticated successfully with space before or after eamil address" do
        user = User.new(
          first_name: 'Test',
          last_name: "Test",
          email: "test@test.com",
          password: "testtest",
          password_confirmation: "testtest"
        )
        user.save
        user = User.authenticate_with_credentials('   test@test.com   ', 'testtest')
        expect(user).not_to be(nil)
      end
      
      

    end

end
