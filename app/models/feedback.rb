class Feedback < ActiveRecord::Base
	validates :email, :message,:fio,  :presence => true
	attr_accessible :fio, :email, :message, :subscribe
end
