class Context < ActiveRecord::Base
  has_many :categories

  validates :name, uniqueness: true, presence: true
end
