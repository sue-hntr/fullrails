class User < ActiveRecord::Base
	has_many	:posts


	validates_presence_of :username, :password
  	validates_uniqueness_of :password



end
