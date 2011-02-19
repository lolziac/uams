class CreateProducts < ActiveRecord::Migration
    def self.up
        create_table :products do |t|
            t.integer "category_id"
            # can also user: t.references :category
            t.string "brand"
            t.string "name"
            t.string "modelnr"
            t.string "serialnr"
            t.integer "supplier_id"
            t.integer "price"
            t.datetime "date_purchased"
            t.text "info"
            t.string "status"
            t.timestamps
        end
        add_index("products", "category_id")
        add_index("products", "supplier_id")
    end

    def self.down
        drop_table :products
    end
end
