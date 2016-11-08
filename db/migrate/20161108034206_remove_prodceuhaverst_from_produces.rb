class RemoveProdceuhaverstFromProduces < ActiveRecord::Migration[5.0]
  def change
    remove_column :produces, :producehaverst, :datetime
  end
end
