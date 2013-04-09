class Frequency < ActiveRecord::Base
  has_many :dataflows
  has_many :interfaces, through: :dataflows

  validates :name, presence: true, uniqueness: true
end
