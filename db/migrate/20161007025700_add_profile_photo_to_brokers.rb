class AddProfilePhotoToBrokers < ActiveRecord::Migration[5.0]
  def change
    add_column :brokers, :profilephoto, :text
  end
end
