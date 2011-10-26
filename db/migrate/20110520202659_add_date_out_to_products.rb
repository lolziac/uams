class AddDateOutToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :date_out, :date
  end

  def self.down
    remove_column :products, :date_out
  end
end
