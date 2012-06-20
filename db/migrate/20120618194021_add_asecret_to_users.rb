class AddAsecretToUsers < ActiveRecord::Migration
  def change
    add_column :users, :asecret, :string
  end
end
