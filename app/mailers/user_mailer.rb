class UserMailer < ActionMailer::Base
  default from: "babshuttle@gmail.com"

  def welcome(user)
  	@user = user
  	mail(to: @user.email, bcc: "hara0115@gmail.com", cc: "jakejooyoung@gmail.com", subject: "Welcome to Bab Shuttle!")
  end

  def welcome_chinese(user)
    @user = user
    mail(to: @user.email, bcc: "hara0115@gmail.com", cc: "jakejooyoung@gmail.com", subject: "Welcome to Bab Shuttle!")
  end

  def refresh(user)
    @user = user
    mail(to: @user.email, subject: "Bab shuttle is now open!")
  end

  def order(order)
  	@order = order
  	@current_user = @order.user
  	mail(to: @order.user.email, bcc: "hara0115@gmail.com", cc: "jakejooyoung@gmail.com", subject: "Order by #{@order.user.name} (#{@order.user.email})")
  end
end
