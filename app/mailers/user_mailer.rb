class UserMailer < ActionMailer::Base
  default from: "babshuttle@gmail.com"

  def welcome(user)
  	@user = user
  	mail(to: @user.email, subect: "Welcome to Bab Shuttle!")
  end

  def order(order)
  	@order = order
  	@current_user = @order.user
  	mail(to: "jakejooyoung@gmail.com", cc: "hara0115@gmail.com", subject: "Order by #{@order.user.name} (#{@order.user.email})")
  end
end
