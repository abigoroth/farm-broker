class RemoveDateFromBids < ActiveRecord::Migration[5.0]
  def change
    remove_column :bids, :date, :date
  end
end
