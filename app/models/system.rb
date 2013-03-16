class System < ActiveRecord::Base
  has_many :from_interfaces, foreign_key: "from_system_id", class_name: "Interface"
  has_many :to_interfaces, foreign_key: "to_system_id", class_name: "Interface"
  has_many :from_systems, through: :to_interfaces
  has_many :to_systems, through: :from_interfaces
end
