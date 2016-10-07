class RemoveAttachmentFromProduces < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :produces, :produceimage
  end
end
