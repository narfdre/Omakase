require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  attr_accessible :email, :name, :password

  before_save :encrypt_password

  validates_presence_of :email
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = find_by_email(email)
    pwdHash = BCrypt::Password.new(user.password);
    if user &&  pwdHash == password
      return user
    else
      return nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password = BCrypt::Password.create(password);
    end
  end
end
