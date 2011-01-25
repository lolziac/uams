class Worker < ActiveRecord::Base

	has_many :cargo
	has_and_belongs_to_many :editors, :class_name => "AdminUser"
	
end
