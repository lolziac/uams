class AddEmployeeToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :employee_id, :integer
  end

  def self.down
    remove_column :products, :employee_id
  end
end
