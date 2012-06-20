class DropTableEmployees < ActiveRecord::Migration
  def up
    drop_table :employees
  end

  def down
  end
end
