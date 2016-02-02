module HomeHelper
  def list_type_title(type)
    case type
      when 'listicle'
        'Listicle'
      when 'whathappens'
        'Suspense'
      when 'dontwanna'
        "Temptation"
      when 'whyi'
        "Confession"
    end
  end
end
