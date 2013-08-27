class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  validates :name, presence: true

  after_create :send_welcome_email
  private
	  def app_params
	    params.require(:user).permit(:name, :address, :email, :updated_at, :created_at)
	  end

	  def send_welcome_email
	  	UserMailer.welcome(self).deliver
	  end
end
