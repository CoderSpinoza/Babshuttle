require 'spec_helper'

describe ItemsController do
	before(:each) do
		@current_user = FactoryGirl.create(:user)
		controller.stub(:devise_user).and_return(@current_user)
	end
	describe "GET INDEX" do
		describe "with admin account" do
			before(:each) do
				@current_user = FactoryGirl.create(:user, email: "hara0115@gmail.com")
			end

			it "should be successful" do
				get :index
				response.should be_success
			end

			it "should list all items" do
				assigns(:items).should eq(Item.order(:name))
			end
		end

		describe "with normal account" do
			before(:each) do
			end

			it "should not list all items" do
			end
		end
	end
end
