class RemoveReferencesFromBrokers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :brokers, :district, index: true, foreign_key: true
  end
end
