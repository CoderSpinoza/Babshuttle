require "statsmix"
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  validates :name, presence: true
  validates :email, length: { minimum: 6 }
  validates :market, presence: true
  has_many :addresses
  has_many :orders
  has_many :delivery_sessions, foreign_key: "driver_id"
  after_create :send_welcome_email


  def admin?
    self.email == "hara0115@gmail.com" or self.email == "jakejooyoung@gmail.com"
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

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)

    user = User.find_by(provider: auth.provider, uid: auth.uid) || User.find_by(email: auth.info.email)
    if user
      user.update_attributes(provider: auth.provider, uid: auth.uid)
    else
      user = User.new_with_auth(auth)
    end
    user
  end

  def self.new_with_auth(auth)
    user = User.new(name: auth.extra.raw_info.name, provider: auth.provider, uid: auth.uid, email: auth.info.email)
  end 

  def korean?
    self.market == "korean"
  end

  def chinese?
    self.market == "chinese"
  end
end
