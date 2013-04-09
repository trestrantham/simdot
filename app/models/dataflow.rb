class Dataflow < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :interface
  belongs_to :frequency

  validates :dataset_id, presence: true, uniqueness: { scope: [:interface_id, :frequency_id] }
  validates :interface_id, presence: true, uniqueness: { scope: [:dataset_id, :frequency_id] }
  validates :frequency_id, uniqueness: { scope: [:dataset_id, :interface_id] }
end
