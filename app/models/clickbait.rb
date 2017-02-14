class Clickbait  < ActiveRecord::Base

  HEADLINE_TYPES = %w(whathappens listicle watchas dontwanna whyi)

  validates :headline_type, inclusion: { in: HEADLINE_TYPES }, presence: true
  validates :headline, presence: true
  before_validation :drop_empty_tags

  def drop_empty_tags
    self.tags.delete_if{ |tag| tag.blank? } if self.tags.present?
  end
end
