class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.string :bid_status
      t.string :day
      t.date :date
      t.time :start_time
      t.time :end_time
      t.decimal :start_price
      t.decimal :highest_price

      t.timestamps
    end
  end
end
