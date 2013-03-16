class Interface < ActiveRecord::Base
  belongs_to :from_system, class_name: "System"
  belongs_to :to_system, class_name: "System"
end
