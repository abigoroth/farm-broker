class CreateFarmsites < ActiveRecord::Migration[5.0]
  def change
    create_table :farmsites do |t|
      t.string :farmsitename
      t.integer :farmsitesize
      t.text :farmsiteaddress
      t.string :farmsiteownername
      t.integer :farmsiteownerphoneno
      t.integer :district_id
      t.integer :farmer_id
      t.float :longitude
      t.float :latitude
      t.timestamps
    end
  end
end
