class AdminUser < ActiveRecord::Base
	# To configure a differenet table name
	# set_table_name("admin_users")
	
	has_and_belongs_to_many :products
	has_and_belongs_to_many :cargos
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :suppliers
	has_and_belongs_to_many :workers
	has_many :cargo_edits
	has_many :cargos, :through => :cargo_edits
	
	scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
	
end
