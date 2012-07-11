class AddValidationTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :validation_token, :string
    add_column :users, :validation_sent_at, :datetime
  end
end
