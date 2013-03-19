class Interface < ActiveRecord::Base
  belongs_to :from_system, class_name: "System"
  belongs_to :to_system, class_name: "System"

  validates_uniqueness_of :from_system, scope: :to_system
  validates_uniqueness_of :to_system, scope: :from_system
end
