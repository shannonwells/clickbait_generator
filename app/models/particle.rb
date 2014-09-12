class Particle < ActiveRecord::Base
  validates_inclusion_of :value, in: %w(A Some This)
end