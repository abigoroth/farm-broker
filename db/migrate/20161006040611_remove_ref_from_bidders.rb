class RemoveRefFromBidders < ActiveRecord::Migration[5.0]
  def change
    remove_reference :bidders, :district, index: true, foreign_key: true
  end
end
