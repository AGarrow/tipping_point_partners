class AddContentToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :content, :text
  end
end
