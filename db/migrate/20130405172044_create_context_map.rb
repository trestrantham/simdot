class CreateContextMap < ActiveRecord::Migration
  def change
    create_table :context_maps do |t|
      t.integer :contextable_id
      t.string  :contextable_type
      t.integer :context_id
      t.integer :category_id

      t.timestamps
    end
  end
end
