require 'digest/sha1'

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

    attr_accessor :password
    EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
    # Standard method of validations
    # validates_presence_of  :first_name
    # validates_length_of  :first_name, :maximum => 25
    # validates_presence_of  :last_name
    # validates_length_of  :last_name, :maximum => 50
    # validates_presence_of  :username
    # validates_length_of  :username, :within => 7..25
    # validates_presence_of  :email
    # validates_length_of  :email, :maximum => 100
    # validates_format_of :email, :with => EMAIL_REGEX
    # validates_confirmation_of :email

    # Sexy Validations
    validates :first_name, :presence => true, :length => { :maximum => 25 }
    validates :last_name, :presence => true, :length => { :maximum => 50 }
    validates :username, :presence => true, :length => { :within => 7..25 }, :uniqueness => true
    validates :email, :presence => true, :length => { :maximum => 100}, :format => EMAIL_REGEX, :confirmation => true

    # only on create. so other attributes of this user can be changed
    validates_length_of :password, :within => 7..25, :on => :create

    before_save :create_hashed_password
    after_save :clear_password

    scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
    scope :sorted, order("admin_users.last_name ASC, admin_users.first_name ASC")
    
    attr_protected :hashed_password, :salt
    
    def name
      "#{first_name} #{last_name}"
    end
    
    def self.authenticate(username="", password="")
        user = AdminUser.find_by_username(username)
        if user && user.password_match?(password)
        return user
        else
        return false
        end
    end
    
    # The same password string with the same hash method and salt
    # should always generate the same hashed_password
    def password_match?(password)
      hashed_password == AdminUser.hash_with_salt(password, salt)
    end

    def self.make_salt(username="")
        Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
    end

    def self.hash_with_salt(password="", salt="")
        Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
    end

    private

    def create_hashed_password
        # Whenever :password has a value hashing is needed
        unless password.blank?
            #always use "self" when assigning values
            self.salt = AdminUser.make_salt(username) if salt.blank?
            self.hashed_password = AdminUser.hash_with_salt(password, salt)
        end
    end

    def clear_password
        #for security and b/c hashing is not needed
        self.password = nil
    end

end
