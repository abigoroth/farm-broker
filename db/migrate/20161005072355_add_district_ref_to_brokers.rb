class AddDistrictRefToBrokers < ActiveRecord::Migration[5.0]
  def change
    add_reference :brokers, :district, foreign_key: true
  end
end
