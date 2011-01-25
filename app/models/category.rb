class Category < ActiveRecord::Base
	
	has_many :products
	
	validates_presence_of :name
	
	scope :visible, where(:visible => true) 
	scope :invisible, where(:visible => false) 
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
	
	has_attached_file :photo, :styles => { :small => "100x100#" , :medium => "140x140>", :large => "200x200>"},
	:url  => "/assets/categories/:id/:style/:basename.:extension",
	:path => ":rails_root/public/assets/categories/:id/:style/:basename.:extension"

	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end