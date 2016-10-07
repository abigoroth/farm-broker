class AddAttachmentProfilephotoToBidders < ActiveRecord::Migration
  def self.up
    change_table :bidders do |t|
      t.attachment :profilephoto
    end
  end

  def self.down
    remove_attachment :bidders, :profilephoto
  end
end
