class Dataset < ActiveRecord::Base
  has_many :dataflows
  has_many :interfaces, through: :dataflows
  has_many :context_maps, as: :contextable
  has_many :contexts, through: :context_maps

  validates :name, presence: true

  def target_systems
    interfaces.map(&:target_system)
  end

  def source_systems
    interfaces.map(&:source_system)
  end
end
