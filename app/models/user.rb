# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def password=(pt)
    @password = pt
    self.password_digest = BCyrpt::Password.create(pt)
  end

  def is_password?(pt)
    BCyrpt::Password.new(self.password_digest).is_password?(pt)
  end

  def self.find_by_credentials(params)
    user = User.find_by(:email => params[:email])
    user.try(:is_password?, params[:password]) ? user : nil
  end
  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
