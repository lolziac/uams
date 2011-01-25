class CreateAdminUsersProductsJoin < ActiveRecord::Migration
  def self.up
	create_table :admin_users_products, :id => false do |t|
		t.integer "admin_user_id"
		t.integer "product_id"
	end
	add_index :admin_users_products, ["admin_user_id", "product_id"]
  end

  def self.down
	drop_table :admin_users_products
  end
  
end
