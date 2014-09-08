class Particle < ActiveRecord::Base
  validates_inclusion_of :value, in: %w(a some this)
end