class User < ActiveRecord::Base
	has_many	:posts
	has_many	:comments

	validates_presence_of :username, :password
  	validates_uniqueness_of :password



end
