class AddBrokerRefToProduces < ActiveRecord::Migration[5.0]
  def change

  	add_reference :produces, :broker, foreign_key: true
  end
end
