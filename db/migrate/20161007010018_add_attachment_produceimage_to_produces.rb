class AddAttachmentProduceimageToProduces < ActiveRecord::Migration
  def self.up
    change_table :produces do |t|
      t.attachment :produceimage
    end
  end

  def self.down
    remove_attachment :produces, :produceimage
  end
end
