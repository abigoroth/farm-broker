class AddStateRefToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_reference :districts, :state, foreign_key: true
  end
end
