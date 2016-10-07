class AddProduceImageToProduces < ActiveRecord::Migration[5.0]
  def change
    add_column :produces, :produceimage, :string
  end
end
