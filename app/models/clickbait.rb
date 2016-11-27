class Clickbait  < ActiveRecord::Base

  HEADLINE_TYPES = %w(whathappens listicle watchas dontwanna whyi)
  attr_accessor :headline, :type, :keyword1, :keyword2

  validates :headline_type, inclusion: { in: HEADLINE_TYPES }, presence: true
  validates :headline, presence: true
end
