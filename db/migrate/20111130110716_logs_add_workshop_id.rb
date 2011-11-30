class LogsAddWorkshopId < ActiveRecord::Migration
  def up
    add_column :logs, :workshop_id, :integer
    add_index :logs, :workshop_id
  end

  def down
    remove_column :logs, :workshop_id
  end
end
