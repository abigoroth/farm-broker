class AddAttachmentAvatarToUsers < ActiveRecord::Migration
  def self.up
    change_table :produces do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :produces, :avatar
  end
end
