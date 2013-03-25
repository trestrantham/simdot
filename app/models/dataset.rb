class Dataset < ActiveRecord::Base
  has_many :dataflows
  has_many :interfaces, through: :dataflows

  def to_systems
    interfaces.map(&:to_system)
  end

  def from_systems
    interfaces.map(&:from_system)
  end
end
