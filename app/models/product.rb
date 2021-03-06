class Product < ActiveRecord::Base
    acts_as_reportable
    belongs_to :category
    belongs_to :supplier
    belongs_to :employee
    has_many :tracks
    has_and_belongs_to_many :editors, :class_name => "AdminUser"

    has_attached_file :photo, :styles => { :small => "120x120#" , :medium => "200x200>", :large => "400x400>"},
		:url  => "/assets/products/:id/:style/:basename.:extension",
		:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

    validates_attachment_presence :photo
    validates_attachment_size :photo, :less_than => 5.megabytes
    validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']

end
