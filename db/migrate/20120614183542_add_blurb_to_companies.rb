class AddBlurbToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :blurb, :text
  end
end
