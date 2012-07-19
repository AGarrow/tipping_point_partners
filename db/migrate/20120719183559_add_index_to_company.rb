class AddIndexToCompany < ActiveRecord::Migration
  def change
    add_index :companies,:email_extension
  end
end
