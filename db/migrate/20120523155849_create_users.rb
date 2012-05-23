class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :company
      t.string :print_code
      t.string :phone
      
      t.timestamps
    end
  end
end
