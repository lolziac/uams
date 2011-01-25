class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
	  t.references :product
	  # same as: t.integer "product_id"
	  t.string "company_name"
	  t.string "business_nr"
	  t.string "fiscal_nr"
	  t.string "owner"
	  t.string "address"
	  t.string "phone"
	  t.boolean "status", :default => false
	  t.text "services"
      t.timestamps
    end
	add_index("suppliers", "product_id")
  end

  def self.down
    drop_table :suppliers
  end
end
