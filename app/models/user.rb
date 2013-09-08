require "statsmix"
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  validates :name, presence: true
  validates :email, length: { minimum: 6 }
  has_many :addresses
  has_many :orders
  after_create :send_welcome_email


  def admin?
    self.email == "hara0115@gmail.com" or self.email == "jakejooyoun@gmail.com"
  end
  
  def send_welcome_email
      # StatsMix.api_key = ENV['STATSMIX_API_KEY']
      # StatsMix.track("User Growth", User.count)
      # if StatsMix.error
      #   puts "Error: #{StatsMix.error}"
      # end

    UserMailer.welcome(self).deliver
  end

  def send_refresh_email
    UserMailer.refresh(self).deliver
  end

  private
	  def app_params
	    params.require(:user).permit(:name, :address, :email, :updated_at, :created_at)
	  end  
end
