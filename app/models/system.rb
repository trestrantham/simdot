class System < ActiveRecord::Base
  has_many :source_interfaces, foreign_key: "source_system_id", class_name: "Interface"
  has_many :target_interfaces, foreign_key: "target_system_id", class_name: "Interface"
  has_many :source_systems, through: :target_interfaces
  has_many :target_systems, through: :source_interfaces

  validates_uniqueness_of :name

  def all_interfaces
    (source_interfaces + target_interfaces).uniq
  end

  def all_dataflows
    all_interfaces.collect(&:dataflows).flatten.uniq
  end

  def all_systems
    (source_systems + target_systems).uniq
  end
end
