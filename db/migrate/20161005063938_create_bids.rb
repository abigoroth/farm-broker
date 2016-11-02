class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.string :bid_status
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :start_price
      t.decimal :highest_price
      t.decimal :max_price
      t.integer :farmer_id
      t.integer :produce_id
      t.integer :bidder_id
      t.timestamps
    end
  end
end
