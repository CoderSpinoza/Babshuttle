require 'spec_helper'
describe "User", js: true do
	it "clicks signup button" do
		visit root_path
		click_button "Sign Up for Free"
	end

	it "clicks login button" do
		visit root_path
		click_button "Login"
	end

	it "clicks home link" do
		visit root_path
		click_link "Home"
	end

	it "clicks about link" do
		visit root_path
		click_link "About"
	end

	it "clicks team link" do
		visit root_path
		click_link "Team"
	end

	it "clicks contact link" do
		visit root_path
		click_link "Contact"
	end
end