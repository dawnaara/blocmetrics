class RegisteredApplication < ActiveRecord::Base
	belongs_to :user
	has_many :registered_applications
end
