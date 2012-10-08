class AddPublicToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :public, :boolean
  end
end
