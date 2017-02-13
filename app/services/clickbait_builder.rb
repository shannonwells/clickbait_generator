class ClickbaitBuilder

  DEFAULT_LIST_TYPE = 'listicle'

  def self.generate(list_type = nil)
    list_type = Clickbait::HEADLINE_TYPES.include?(list_type) ? list_type : 'listicle'
    Clickbait.new new_headline(list_type).merge(headline_type: list_type)
  end

  class << self

    private

    def new_headline(list_type)
      srand(Time.now.to_i)
      self.send(list_type)
    end

    def listicle
      items = rand(99)+2
      noun = random_model('Noun', {is_proper: false})
      adj = random_model('Adjective')
      pred = random_model('Predicate')
      { headline: "The #{items} #{adj.value} #{noun.value.pluralize} That #{pred.value}",
        tags: [noun.value,adj.value] }
    end

    def whyi
      noun = random_model('Noun')
      adj = random_model('Adjective')
      verb = random_model('Verb')
      verb_string = verb.value.downcase
      sub_obj = verb_string.verb.conjugate(subject: "I", tense: :past, person: :first, aspect: :perfective).titleize
      method = ['Why','How','The Day','I Wish'][rand(52)%4]

      { headline: "#{method} #{sub_obj} #{particle_for(adj.value,noun)} #{adj.value} #{noun.value}",
        tags: [noun.value,verb.value ] }
    end

    def whathappens
      first = random_model('First')
      next_clause = random_model('Next')
      noun = random_model('Noun', {is_agent: true})

      if rand(50)%10 == 0 and !Rails.env.test?  # breaking tests
        last_half = "SAD!!!"
      else
        last_half = "What Happened Next #{next_clause.value}."
      end

      { headline: "#{particle_for(noun.value,noun)} #{noun.value} #{first.value}. #{last_half}",
        tags: [noun.value] }
    end

    def dontwanna
      noun = random_model('Noun', {is_proper: false})
      adj = random_model('Adjective')
      verb = random_model('Verb')
      { headline: "You Don't Want To #{verb.value} This #{adj.value} #{noun.value}",
        tags: [noun.value,verb.value] }
    end

    def watchas
      noun = random_model('Noun', {is_agent: true})
      noun2 = random_model('Noun')
      adj = random_model('Adjective')

      verb = random_model('Verb')
      verb_string = verb.value.downcase
      sub_obj = verb_string.verb.conjugate(subject: noun.value).titleize
      particle = noun.is_proper? ? '' : 'This'
      { headline: "Watch As #{particle} #{sub_obj} #{particle_for(adj.value,noun2)} #{adj.value} #{noun2.value}",
        tags: [noun.value,noun2.value] }
    end

    def random_model(klass_name, opts={})
      klass = Class.const_get klass_name
      num_model = klass.where(opts).count
      model = klass.where(opts).offset(rand(num_model)).take
    end

    def particle_for(adj, noun)
      return '' if noun.is_proper
      particle = random_model('Particle').value
      particle = 'An' if particle == 'A' && adj.match(/\A[aeiou]/i)
      particle
    end

  end
end
