class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :comment_message
      t.datetime :comment_date
      t.integer :broker_id
      t.integer :wallpost_id
      t.timestamps
    end
  end
end
