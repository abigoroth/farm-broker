class CreateBidders < ActiveRecord::Migration[5.0]
  def change
    create_table :bidders do |t|
      t.string :name
      t.datetime :dob
      t.string :address
      t.string :phone
      t.string :credit_card
      t.string :time_zone, default: "UTC"
      t.timestamps
    end
  end
end
