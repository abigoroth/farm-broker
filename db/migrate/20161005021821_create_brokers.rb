class CreateBrokers < ActiveRecord::Migration[5.0]
  def change
    create_table :brokers do |t|
      t.string :name
      t.datetime :dob
      t.string :address
      t.string :phone
      t.string :account_no

      t.timestamps
    end
  end
end
