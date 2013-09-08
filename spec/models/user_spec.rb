require 'spec_helper'

describe "User" do
	it "should be valid" do
		FactoryGirl.build(:user).should be_valid
	end

	it "should have a name" do
		FactoryGirl.build(:user, name: "").should_not be_valid
	end

	it "should have an email" do
		FactoryGirl.build(:user, email: "").should_not be_valid
	end

	it "should have an email longer than 5 letters" do
		FactoryGirl.build(:user, email: "h@h.h").should_not be_valid
	end

	it "should have a password" do
		FactoryGirl.build(:user, password: "").should_not be_valid
	end
end
