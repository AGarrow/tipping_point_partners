class AddAvatarOptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_option, :string
  end
end
