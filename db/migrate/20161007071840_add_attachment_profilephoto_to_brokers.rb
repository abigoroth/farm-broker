class AddAttachmentProfilephotoToBrokers < ActiveRecord::Migration
  def self.up
    change_table :brokers do |t|
      t.attachment :profilephoto
    end
  end

  def self.down
    remove_attachment :brokers, :profilephoto
  end
end
