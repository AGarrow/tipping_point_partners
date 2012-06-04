class RemoveCompanyFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :company
      end

  def down
    add_column :users, :company, :string
  end
end
