class AddAttachmentPictureToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :picture_file_name, :string
    add_column :questions, :picture_content_type, :string
    add_column :questions, :picture_file_size, :integer
  end
end
