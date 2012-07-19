class AddCompanyIdToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :company_id, :integer
  end
end
