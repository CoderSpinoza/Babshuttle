require 'spec_helper'

describe HomeController do
	before(:each) do
		@current_user = FactoryGirl.create(:user)
		controller.stub(:devise_user).and_return(@current_user)
	end
	describe "GET INDEX" do
		it "should be successful" do
			get :index
			response.should be_success
		end
	end

	describe "GET ABOUT" do
		it "should be successful" do
			get :about
			response.should be_success
		end
	end

	describe "GET TEAM" do
		it "should be successful" do
			get :team
			response.should be_success
		end
	end

	describe "GET CONTACT" do
		it "should be successful" do
			get :contact
			response.should be_success
		end
	end

	describe "GET METRICS" do
		describe "with admin account" do
			before(:each) do
				@user = User.create(email: "hara0115@gmail.com", name: "Hara Kang", password: "Babshuttle2013", password_confirmation: "Babshuttle2013")
				controller.stub(:current_user).and_return(@user)
				get :metrics
			end

			it "should be successful" do
				response.should be_success
			end

			it "should have @users as all users" do
				assigns(:users).should eq(User.all)
			end
		end

		describe "with normal account" do
			it "should not be successful" do

				controller.stub(:current_user).and_return(@current_user)
				get :metrics
				response.should be_success
			end
		end
	end
end
