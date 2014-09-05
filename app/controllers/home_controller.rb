class HomeController < ApplicationController
  def index
    @headline = new_headline
  end

  def generate
    @headline = new_headline
    render :index
  end

  def new_headline
    srand(Time.now.to_i)
    items = rand(99)+2
    num_nouns = Noun.count
    @whathappens = false
    if params[:whathappens] && params[:whathappens] == 'true'
      @whathappens = true
      # TODO: Make all nouns singular in the DB
      noun = Noun.limit(1).offset(rand(num_nouns)).first

      num_firsts = First.count
      first = First.limit(1).offset(rand(num_firsts)).first.value

      num_next = Next.count
      next_clause = Next.limit(1).offset(rand(num_next)).first.value
      num_particles = Particle.count

      particle = noun.is_proper ? '' : Particle.limit(1).offset(rand(num_particles)).first.value

      particle = 'An' if particle == 'A' && noun.value.match(/^aeiou/)

      @headline = "#{particle} #{noun.value.singularize} #{first}. What Happened Next #{next_clause}.".html_safe
    else  # Listicle
      noun = Noun.limit(1).offset(rand(num_nouns)).first.value.pluralize

      num_adj = Adjective.count
      adj = Adjective.limit(1).offset(rand(num_adj)).first.value

      num_pred = Predicate.count
      pred = Predicate.limit(1).offset(rand(num_pred)).first.value
      @headline = "The #{items} #{adj} #{noun} That #{pred}".html_safe
    end
  end
end
