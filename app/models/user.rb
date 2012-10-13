require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  attr_accessor :update_password
  attr_accessible :email, :name, :password

  before_save :encrypt_password, :if => :should_update_password?

  validates_presence_of :email, :name
  validates_uniqueness_of :email

  validates :password, :presence => true, :if => :new_record?

  def self.authenticate(email, password)
    user = find_by_email(email)
    pwdHash = BCrypt::Password.new(user.password)
    if user &&  pwdHash == password
      return user
    else
      return nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password = BCrypt::Password.create(password)
    end
  end

  private
    def should_update_password?
      update_password || new_record?
    end
end
