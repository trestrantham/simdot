class ContextMap < ActiveRecord::Base
  belongs_to :context
  belongs_to :category
  belongs_to :contextable, polymorphic: true

  validates :contextable_id,    presence: true
  validates :contextable_type,  presence: true
  validates :context_id,        presence: true, uniqueness: { scope: [:contextable_id, :contextable_type], case_sensitive: false }
  validates :category_id,       uniqueness: { scope: [:contextable_id, :contextable_type, :context_id], case_sensitive: false }

  validate  :category_belongs_to_context

  def category_belongs_to_context
    errors.add(:category, "must be a member of a valid context.") if !category_id.nil? && (category.nil? || category.context_id != context_id)
  end
end
