class User < ActiveRecord::Base
  attr_accessible :email, :name, :twitter
end
