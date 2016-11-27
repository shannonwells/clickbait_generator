module HomeHelper
  def list_type_title(headline_type)
    case headline_type
      when 'listicle'
        'Listicle'
      when 'whathappens'
        'Suspense'
      when 'dontwanna'
        "Temptation"
      when 'whyi'
        "Confession"
      when 'watchas'
        "Voyeurism"
    end
  end
end
