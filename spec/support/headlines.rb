module Headlines
  def create_a_few_models
    3.times do
      Noun.create! value: Faker::Hipster.word.capitalize, is_agent: true
      Noun.create! value: Faker::Name.first_name, is_agent: true, is_proper: true
      Noun.create! value: Faker::Hipster.word.capitalize
    end
    Particle.create! value: "Some"
    Particle.create! value: "This"
    Particle.create! value: "A"
    [Adjective, First, Next, Predicate, Superlative, Verb].each do |klass|
      3.times do
        klass.create! value: Faker::Color.color_name.capitalize
      end
    end
  end
end
