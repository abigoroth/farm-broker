class AddDistrictRefToBidders < ActiveRecord::Migration[5.0]
  def change
    add_reference :bidders, :district, foreign_key: true
  end
end
