class RenameEndTimeFromBids < ActiveRecord::Migration[5.0]
  def change
    change_column :bids, :end_time, :datetime
  end
end
