class ChangeInterfaceColumnNames < ActiveRecord::Migration
  def change
    rename_column :interfaces, :from_system_id, :source_system_id
    rename_column :interfaces, :to_system_id, :target_system_id
  end
end
