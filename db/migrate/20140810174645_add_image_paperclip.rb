class AddImagePaperclip < ActiveRecord::Migration
  def self.up
      remove_column :profiles, :image
      add_column :profiles, :image_file_name,    :string
      add_column :profiles, :image_content_type, :string
      add_column :profiles, :image_file_size,    :integer
      add_column :profiles, :image_updated_at,   :datetime
  end
  
  def self.down
     remove_column :profiles, :image_file_name
     remove_column :profiles, :image_content_type
     remove_column :profiles, :image_file_size
     remove_column :profiles, :image_updated_at
  end
end
