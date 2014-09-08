class HomeController < ApplicationController
  def index
    @current_val = 'listicle'
    @headline = new_headline
  end

  def generate
    @current_val = params[:headline_type]
    @headline = new_headline
    render :index
  end

  def new_headline
    srand(Time.now.to_i)
    items = rand(99)+2
    num_nouns = Noun.count
    noun = Noun.limit(1).offset(rand(num_nouns)).first
    case @current_val
      when 'whathappens'
        @type = params[:headline_type]
        # TODO: Make all nouns singular in the DB

        num_firsts = First.count
        first = First.limit(1).offset(rand(num_firsts)).first.value

        num_next = Next.count
        next_clause = Next.limit(1).offset(rand(num_next)).first.value
        num_particles = Particle.count

        particle = noun.is_proper ? '' : Particle.limit(1).offset(rand(num_particles)).first.value
        particle = 'An' if particle == 'A' && noun.value.match(/^[aeiouh]/i)

        "#{particle} #{noun.value} #{first}. What Happened Next #{next_clause}.".html_safe
      when 'listicle'
        num_adj = Adjective.count
        adj = Adjective.limit(1).offset(rand(num_adj)).first.value

        num_pred = Predicate.count
        pred = Predicate.limit(1).offset(rand(num_pred)).first.value
        "The #{items} #{adj} #{noun.value.pluralize} That #{pred}".html_safe
      when 'watchas'
        particle = noun.is_proper ? '' : Particle.limit(1).offset(rand(num_particles)).first.value
        particle = 'An' if particle == 'A' && noun.value.match(/^[aeiouh]/i)

        noun2 = Noun.limit(1).offset(rand(num_nouns)).first
        particle2 = noun.is_proper ? '' : Particle.limit(1).offset(rand(num_particles)).first.value
        particle2 = 'An' if particle == 'A' && noun.value.match(/^[aeiouh]/i)

        num_verbs = Verb.count
        verb = Verb.limit(1).offset(rand(num_verbs)).first.value.pluralize

        num_adj = Adjective.count
        adj = Adjective.limit(1).offset(rand(num_adj)).first.value

        "Watch As #{particle} #{noun.value} #{verb} #{particle2} #{adj} #{noun2.value}"
      when 'dontwanna'
        num_adj = Adjective.count
        adj = Adjective.limit(1).offset(rand(num_adj)).first.value

        num_verbs = Verb.count
        verb = Verb.limit(1).offset(rand(num_verbs)).first.value

        "You Don't Want To #{verb} This #{adj} #{noun.value}"
    end

  end
end
