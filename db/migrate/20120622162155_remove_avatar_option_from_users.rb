class RemoveAvatarOptionFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :avatar_option
      end

  def down
    add_column :users, :avatar_option, :string
  end
end
