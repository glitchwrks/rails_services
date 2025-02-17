class DropPastes < ActiveRecord::Migration[8.0]
  def up
    drop_table :pastes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
