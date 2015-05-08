require 'spec_helper'

describe "Users" do

  describe "all" do
 	it "should have the content 'ALL USERS'" do
    	visit '/'
    expect(page).to have_content('ALL USERS')
  	end
  end

  describe "new" do

 	it "should have the content 'Sign up'" do
    	visit '/signup'
    expect(page).to have_content('Sign up')
  	end

  end

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }
 
  
  
  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end



describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it {  should_not be_valid }
  end
 end


end