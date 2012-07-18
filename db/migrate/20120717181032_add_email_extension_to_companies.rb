class AddEmailExtensionToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :email_extension, :string
  end
end
