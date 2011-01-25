class CreateCargoEdits < ActiveRecord::Migration
  def self.up
    create_table :cargo_edits do |t|
	  t.references :admin_user
	  t.references :cargo
	  t.string "summary"
      t.timestamps
    end
	add_index :cargo_edits, ['admin_user_id', 'cargo_id']
  end 

  def self.down
    drop_table :cargo_edits
  end
end
