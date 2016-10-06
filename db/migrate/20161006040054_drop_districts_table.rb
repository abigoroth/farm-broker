class DropDistrictsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :districts
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
end
