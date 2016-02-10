class Clickbait

  attr_accessor :headline, :type

  include ActiveModel::Model
  include ActiveModel::Validations

  alias :read_attribute_for_serialization :send

  TYPES = %w(whathappens listicle watchas dontwanna whyi)

  validates :type, inclusion: { in: TYPES }

end
