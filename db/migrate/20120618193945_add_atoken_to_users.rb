class AddAtokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :atoken, :string
  end
end
