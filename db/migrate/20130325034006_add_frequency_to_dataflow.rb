class AddFrequencyToDataflow < ActiveRecord::Migration
  def change
    add_column :dataflows, :frequency_id, :integer
  end
end
