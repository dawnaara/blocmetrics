class RegisteredApplication < ActiveRecord::Base
	has_many :users
end
