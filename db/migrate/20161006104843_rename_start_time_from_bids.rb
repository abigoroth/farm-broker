class RenameStartTimeFromBids < ActiveRecord::Migration[5.0]
  def change
    change_column :bids, :start_time, :datetime
  end
end
