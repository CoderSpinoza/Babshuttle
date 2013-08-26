class UserMailer < ActionMailer::Base
  default from: "babshuttle@gmail.com"

  def welcome(user)
  	@user = user
  	mail(to: @user.email, subect: "Welcome to Bab Shuttle!")
  end
end
