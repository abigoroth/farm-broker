class AddTimeZoneToBidders < ActiveRecord::Migration[5.0]
  def change
    add_column :bidders, :time_zone, :string, default: "UTC"
  end
end
