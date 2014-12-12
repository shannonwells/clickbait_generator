class HomeController < ApplicationController
  HEADLINE_TYPES = %w(whathappens listicle watchas dontwanna whyi)
  def index
    @current_val = 'listicle'
    @headline = new_headline
  end

  def generate
    if (request.get?)
      redirect_to :root and return
    end
    @current_val = params[:headline_type]
    @headline = new_headline.html_safe
    render :index
  end

  def new_headline
    srand(Time.now.to_i)
    if HEADLINE_TYPES.include? @current_val
      @headline = self.send(@current_val.to_sym)
    end
  end

  def whathappens
    num_nouns = Noun.where(is_agent: true).count
    @type = params[:headline_type]
    # TODO: Make all nouns singular in the DB

    num_firsts = First.count
    first = First.limit(1).offset(rand(num_firsts)).first.value

    num_next = Next.count
    next_clause = Next.limit(1).offset(rand(num_next)).first.value
    noun = Noun.where(is_agent: true).limit(1).offset(rand(num_nouns)).first

    if rand(num_nouns)%9 == 0
      last_half = "THANKS, OBAMA."
    else
      last_half = "What Happened Next #{next_clause}."
    end

    "#{set_particle(noun.value,noun)} #{noun.value} #{first}. #{last_half}"
  end

  def listicle
    items = rand(99)+2
    num_nouns = Noun.where(is_proper: false).count
    noun = Noun.where(is_proper: false).limit(1).offset(rand(num_nouns)).first
    num_adj = Adjective.count
    adj = Adjective.limit(1).offset(rand(num_adj)).first.value

    num_pred = Predicate.count
    pred = Predicate.limit(1).offset(rand(num_pred)).first.value
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
    "Watch As #{particle} #{sub_obj} #{set_particle(noun.value,noun)} #{adj} #{noun2.value}"
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

    " #{verb_string} This #{adj} #{noun.value}"
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
