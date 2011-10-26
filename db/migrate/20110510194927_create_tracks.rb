class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
            t.integer "product_id"
            t.integer "employee_id"
            # can also user: t.references :category
            t.date "date_out"
            t.date "date_in"
            t.string "status"
            t.text "info"
            t.timestamps
    end
        add_index("tracks", "product_id")
        add_index("tracks", "employee_id")
  end

  def self.down
    drop_table :tracks
  end
end
