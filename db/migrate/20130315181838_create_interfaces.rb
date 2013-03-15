class CreateInterfaces < ActiveRecord::Migration
  def change
    create_table :interfaces do |t|
      t.integer :from_system_id
      t.integer :to_system_id

      t.timestamps
    end
  end
end
