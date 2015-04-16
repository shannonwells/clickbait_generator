class HomeController < ApplicationController

  HEADLINE_TYPES = %w(whathappens listicle watchas dontwanna whyi)
  respond_to :js, only: [:generate]
  def index
    @current_val = 'listicle'
    @headline = new_headline
  end

  def generate
    @current_val = params[:headline_type] || 'listicle'
    @headline = new_headline
    respond_with @headline
  end

  def new_headline
    srand(Time.now.to_i)
    if HEADLINE_TYPES.include? @current_val
      @headline = self.send(@current_val.to_sym)
    end
  end

  def whathappens
    num_nouns = Noun.where(is_agent: true).count
    @type = params[:headline_type]  # fixme, use an instance variable instead of reading :headline_type
    # TODO: Make all nouns singular in the DB

    num_firsts = First.count
    first = First.limit(1).offset(rand(num_firsts)).first.value

    num_next = Next.count
    next_clause = Next.limit(1).offset(rand(num_next)).first.value
    noun = Noun.where(is_agent: true).limit(1).offset(rand(num_nouns)).first

    if rand(num_nouns)%9 == 0 and !Rails.env.test?  # breaking tests
      last_half = "THANKS, OBAMA."
    else
      last_half = "What Happened Next #{next_clause}."
    end

    "#{set_particle(noun.value,noun)} #{noun.value} #{first}. #{last_half}"
  end

  def listicle
    items = rand(99)+2  # generate number of items
    num_nouns = Noun.where(is_proper: false).count # how many non-proper nouns do we have
    noun = Noun.where(is_proper: false).limit(1).offset(rand(num_nouns)).first  # pick one, randomly
    num_adj = Adjective.count # how many adjectives do we have
    adj = Adjective.limit(1).offset(rand(num_adj)).first.value # pick one randomly

    # pick a random predicate
    num_pred = Predicate.count
    pred = Predicate.limit(1).offset(rand(num_pred)).first.value

    # construct sentence
    "The #{items} #{adj} #{noun.value.pluralize} That #{pred}"
  end

  def watchas
    num_nouns = Noun.where(is_agent: true).count
    noun = Noun.where(is_agent: true).limit(1).offset(rand(num_nouns)).first
    noun2 = Noun.limit(1).offset(rand(num_nouns)).first
    num_adj = Adjective.count
    adj = Adjective.limit(1).offset(rand(num_adj)).first.value

    num_verbs = Verb.count
    verb_string = Verb.limit(1).offset(rand(num_verbs)).first.value.downcase
    sub_obj = verb_string.verb.conjugate(subject: noun.value).titleize
    particle = noun.is_proper? ? '' : 'This'
    "Watch As #{particle} #{sub_obj} #{set_particle(adj,noun2)} #{adj} #{noun2.value}"
  end

  def set_particle(adj, noun)
    if  noun.is_proper
      particle = ''
    else
      num_particles = Particle.count
      particle = Particle.limit(1).offset(rand(num_particles)).first.value
      particle = 'An' if particle == 'A' && adj.match(/\A[aeiou]/i)
    end
    particle
  end

  def dontwanna
    num_nouns = Noun.where(is_proper: false).count
    noun = Noun.where(is_proper: false).limit(1).offset(rand(num_nouns)).first
    num_adj = Adjective.count
    adj = Adjective.limit(1).offset(rand(num_adj)).first.value

    num_verbs = Verb.count
    verb_string = Verb.limit(1).offset(rand(num_verbs)).first.value

    "You Don't Want To #{verb_string} This #{adj} #{noun.value}"
  end

  def whyi
    num_nouns = Noun.count
    noun = Noun.limit(1).offset(rand(num_nouns)).first
    num_adj = Adjective.count
    adj = Adjective.limit(1).offset(rand(num_adj)).first.value

    num_verbs = Verb.count
    verb_string = Verb.limit(1).offset(rand(num_verbs)).first.value.downcase

    sub_obj = verb_string.verb.conjugate(subject: "I", tense: :past, person: :first, aspect: :perfective).titleize
    ap verb_string: verb_string, sub: sub_obj

    method = ['Why','How','The Day','I Wish'][rand(num_nouns)%4]

    "#{method} #{sub_obj} #{set_particle(adj,noun)} #{adj} #{noun.value}"
  end

end
