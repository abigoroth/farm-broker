class CreateBidProcesses < ActiveRecord::Migration[5.0]
  def change
    create_table :bid_processes do |t|
      t.decimal :price
      t.integer :bid_id
      t.integer :bidder_id
      t.timestamps
    end
  end
end
