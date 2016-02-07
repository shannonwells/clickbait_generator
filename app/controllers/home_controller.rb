class HomeController < ApplicationController

  before_action :generate_clickbait, only: [:index, :generate]

  def index
  end

  def generate
  end

  def new_headline
    srand(Time.now.to_i)
    if HEADLINE_TYPES.include? @current_val
      @headline = self.send(@current_val.to_sym)
    end
  end

  def whathappens
    @type = params[:headline_type]
    first = random_model('First')
    next_clause = random_model('Next')
    noun = random_model('Noun', {is_agent: true})

    if rand(50)%10 == 0 and !Rails.env.test?  # breaking tests
      last_half = "THANKS, OBAMA."
    else
      last_half = "What Happened Next #{next_clause.value}."
    end

    "#{particle_for(noun.value,noun)} #{noun.value} #{first.value}. #{last_half}"
  end

  def listicle
    items = rand(99)+2
    noun = random_model('Noun', {is_proper: false})
    adj = random_model('Adjective')
    pred = random_model('Predicate')
    "The #{items} #{adj.value} #{noun.value.pluralize} That #{pred.value}"
  end

  def watchas
    noun = random_model('Noun', {is_agent: true})
    noun2 = random_model('Noun')
    adj = random_model('Adjective')

    verb = random_model('Verb')
    verb_string = verb.value.downcase
    sub_obj = verb_string.verb.conjugate(subject: noun.value).titleize
    particle = noun.is_proper? ? '' : 'This'
    "Watch As #{particle} #{sub_obj} #{particle_for(adj.value,noun2)} #{adj.value} #{noun2.value}"
  end

  def dontwanna
    noun = random_model('Noun', {is_proper: false})
    adj = random_model('Adjective')
    verb = random_model('Verb')
    "You Don't Want To #{verb.value} This #{adj.value} #{noun.value}"
  end

  def madlib

  end

  private

  def generate_clickbait
    @clickbait = ClickbaitBuilder.generate(params[:headline_type])
    @current_val = @clickbait.type
    @headline = @clickbait.headline
  end

end
