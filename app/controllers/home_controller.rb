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
    if params[:whathappens] && params[:whathappens] == 'true'
      num_nouns = Noun.where(is_singular: true).count
      noun = Noun.limit(1).where(is_singular: true).offset(rand(num_nouns)).first.value

      num_firsts = First.count
      first = First.limit(1).offset(rand(num_firsts)).first.value

      num_next = Next.count
      next_clause = Next.limit(1).offset(rand(num_next)).first.value
      num_particles = Particle.count
      particle = Particle.limit(1).offset(rand(num_particles)).first.value

      @headline = "#{particle} #{noun} #{first}. What Happened Next #{next_clause}."
    else
      num_nouns = Noun.where(is_singular: false).count
      noun = Noun.limit(1).where(is_singular: false).offset(rand(num_nouns)).first.value

      num_adj = Adjective.count
      adj = Adjective.limit(1).offset(rand(num_adj)).first.value

      num_pred = Predicate.count
      pred = Predicate.limit(1).offset(rand(num_pred)).first.value
      @headline = "The #{items} #{adj} #{noun} That #{pred}"
    end
  end
end
