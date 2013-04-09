class Interface < ActiveRecord::Base
  belongs_to :source_system, class_name: "System"
  belongs_to :target_system, class_name: "System"
  has_many :dataflows
  has_many :frequencies, through: :dataflows

  validates :source_system_id, presence: true, uniqueness: { scope: :target_system_id }
  validates :target_system_id, presence: true, uniqueness: { scope: :source_system_id }
end
