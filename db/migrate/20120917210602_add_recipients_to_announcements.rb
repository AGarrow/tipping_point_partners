class AddRecipientsToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :recipients, :text
  end
end
