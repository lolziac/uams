class CreateCargos < ActiveRecord::Migration
  def self.up
    create_table :cargos do |t|
	  t.references :product
	  t.references :worker
	  t.string "status"
	  t.text "info"
      t.timestamps
    end
	add_index("cargos", "product_id")
	add_index("cargos", "worker_id")
  end

  def self.down
    drop_table :cargos
  end
end