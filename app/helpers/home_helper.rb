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
  def clickbait_button(button_type, headline_type)
    activeclass = button_type == headline_type ? 'active' : ''
    color = cycle(*(%w(orange pink blue green)))
    icon = ["♔", "♕", "♖", "♗"].sample
    title = list_type_title(button_type)

    button_class = ["sparkley button button--clickbait round", activeclass, color].join(" ")
    content_tag :span,
                title,
                {id: button_type,
                class: button_class,
                "data-icon" => icon, "title": title}
  end
end
