class AddDateInToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :date_in, :date
  end

  def self.down
    remove_column :products, :date_in
  end
end
