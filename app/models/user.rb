# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string(255)      not null
#  password_digest  :string(255)      not null
#  session_token    :string(255)      not null
#  created_at       :datetime
#  updated_at       :datetime
#  activated        :boolean          default(FALSE)
#  activation_token :string(255)
#

class User < ActiveRecord::Base
  attr_reader :password

  before_validation :ensure_session_token
  before_validation :ensure_activation_token

  validates :password_digest, :presence => true
  validates :password, :presence => true, :on => :create
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :activation_token, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def activate!
    self.activated = true
    self.save!
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def password=(pt)
    @password = pt
    self.password_digest = BCrypt::Password.create(pt)
  end

  def is_password?(pt)
    BCrypt::Password.new(self.password_digest).is_password?(pt)
  end

  def self.find_by_credentials(params)
    user = User.find_by(:email => params[:email])
    user.try(:is_password?, params[:password]) ? user : nil
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def ensure_activation_token
    self.activation_token ||= self.class.generate_session_token
  end
end
