class Frequency < ActiveRecord::Base
  has_many :dataflows
  has_many :interfaces, through: :dataflows
end
