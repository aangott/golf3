class User < ActiveRecord::Base

  attr_accessor :password
  before_save :encrypt_new_password

  def self.authenticate(username, password)
    user = User.where(username: username).first
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end

  protected
    def encrypt_new_password
      return if password.blank?
      self.hashed_password = encrypt(password)
    end

    def encrypt(string)
      Digest::SHA1.hexdigest(string)
    end

end