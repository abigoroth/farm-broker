class CreateFarmers < ActiveRecord::Migration[5.0]
  def change
    create_table :farmers do |t|
      t.string :name
      t.datetime :dob
      t.string :address
      t.string :phone
      t.string :account_no

      t.timestamps
    end
  end
end
