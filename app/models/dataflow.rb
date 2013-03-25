class Dataflow < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :interface
  belongs_to :frequency
end
