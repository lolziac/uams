class Cargo < ActiveRecord::Base

    belongs_to :editor, :class_name => "AdminUser", :foreign_key => 'admin_user_id'
    belongs_to :worker
    belongs_to :product
    has_many :editors, :through => :cargo_edits, :class_name => "AdminUser"

end
