class Category < ActiveRecord::Base
  belongs_to :context

  validates :name,       presence: true, uniqueness: { scope: :context_id }
  validates :context_id, presence: true, uniqueness: { scope: :name }
end
