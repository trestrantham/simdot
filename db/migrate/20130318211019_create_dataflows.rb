class CreateDataflows < ActiveRecord::Migration
  def change
    create_table :dataflows do |t|
      t.integer :dataset_id
      t.integer :interface_id

      t.timestamps
    end
  end
end
