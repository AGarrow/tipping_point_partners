class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :content
      t.string :title
      t.integer :company_id

      t.timestamps
    end
    add_index :announcements, [:company_id, :created_at]
  end
end
