class AddProducehavestToProduces < ActiveRecord::Migration[5.0]
  def change
    add_column :produces, :produceharvest, :datetime
  end
end
