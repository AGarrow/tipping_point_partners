class RemoveContentFromAnnouncements < ActiveRecord::Migration
  def up
    remove_column :announcements, :content
      end

  def down
    add_column :announcements, :content, :string
  end
end
