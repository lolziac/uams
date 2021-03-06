class Supplier < ActiveRecord::Base

    has_many :products
    has_and_belongs_to_many :editors, :class_name => "AdminUser"

    has_attached_file :photo, :styles => { :small => "150x45>" , :medium => "200x60>", :large => "300x120>"},
		:url  => "/assets/suppliers/:id/:style/:basename.:extension",
		:path => ":rails_root/public/assets/suppliers/:id/:style/:basename.:extension"

    validates_attachment_presence :photo
    validates_attachment_size :photo, :less_than => 5.megabytes
    validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
    
end
