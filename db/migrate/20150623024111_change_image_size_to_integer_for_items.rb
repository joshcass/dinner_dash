class ChangeImageSizeToIntegerForItems < ActiveRecord::Migration
  def change
    remove_column :items, :image_file_size
    add_column :items, :image_file_size, :integer
  end
end
