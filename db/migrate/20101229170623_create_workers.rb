class CreateWorkers < ActiveRecord::Migration
  def self.up
    create_table :workers do |t|
	  t.string "first_name", :limit => 25
	  t.string "last_name", :limit => 50
	  t.string "uni_nr"
	  t.string "date_employed"
	  t.string "profesion"
	  t.string "departament"
	  t.string "office"
	  t.string "email", :default => "", :null => false
	  t.string "password", :limit => 40
	  t.string "phone", :limit => 15
	  t.string "status"
      t.timestamps
    end
  end

  def self.down
    drop_table :workers
  end
end