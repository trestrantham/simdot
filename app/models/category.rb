class Category < ActiveRecord::Base
  belongs_to :context

  validates :name,    presence: true, uniqueness: true
  validates :context, presence: true
end
