class Interface < ActiveRecord::Base
  belongs_to :source_system, class_name: "System"
  belongs_to :target_system, class_name: "System"
  has_many :frequencies, through: :dataflows
  has_many :dataflows

  validates_uniqueness_of :source_system, scope: :target_system
  validates_uniqueness_of :target_system, scope: :source_system
end
