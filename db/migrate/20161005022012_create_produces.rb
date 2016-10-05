class CreateProduces < ActiveRecord::Migration[5.0]
  def change
    create_table :produces do |t|
      t.string :producename
      t.string :producetype
      t.datetime :producedate
      t.integer :producequantity
      t.text :producedescription
      t.integer :farmsite_id

      t.timestamps
    end
  end
end
