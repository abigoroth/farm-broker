class AddBrokerRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :broker, foreign_key: true
  end
end
