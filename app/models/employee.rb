class Employee < ActiveRecord::Base

    has_many :tracks
    has_many :products

    has_attached_file :photo, :styles => { :small => "46x46>" , :medium => "86x86>", :large => "160x160>"},
    :url  => "/assets/employees/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/employees/:id/:style/:basename.:extension"

    validates_attachment_presence :photo
    validates_attachment_size :photo, :less_than => 5.megabytes
    validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']

end
