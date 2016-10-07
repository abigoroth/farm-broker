class AddProfilePhotoToBidders < ActiveRecord::Migration[5.0]
  def change
    add_column :bidders, :profilephoto, :text
  end
end
