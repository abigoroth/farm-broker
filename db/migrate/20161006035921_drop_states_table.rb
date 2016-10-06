class DropStatesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :states
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
