class Track < ActiveRecord::Base
  
   belongs_to :product
   belongs_to :employee
   
end
