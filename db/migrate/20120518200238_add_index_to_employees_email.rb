class AddIndexToEmployeesEmail < ActiveRecord::Migration
  def change
    add_index :employees, :email, unique: true
  end
end
