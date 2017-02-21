# coding: utf-8
module HomeHelper
  # Icons ripped from http://panmental.de/symbols/info.htm
  # For anything fancier, we might need an icon font
  HEADLINE_TYPES = {
    listicle: {
      display: "Listicle",
      icon: "✪",
      color: "orange"
    },
    whathappens: {
      display: "Suspense",
      icon: "⌛",
      color: "pink"
    },
    dontwanna: {
      display: "Temptation",
      icon: "⚖",
      color: "blue"
    },
    whyi: {
      display: "Confession",
      icon: "☠",
      color: "green"
    },
    watchas: {
      display: "Voyeurism",
      icon: "☻",
      color: "orange"
    }
  }.freeze

  def list_type_title(headline_type)
    HEADLINE_TYPES[headline_type.to_sym][:display]
  end

  def list_type_color(headline_type)
    HEADLINE_TYPES[headline_type.to_sym][:color]
  end

  def list_type_icon(headline_type)
    HEADLINE_TYPES[headline_type.to_sym][:icon]
  end

  def clickbait_button(button_type, headline_type)
    activeclass = button_type == headline_type ? 'active' : ''
    color = list_type_color(button_type)
    icon = list_type_icon(button_type)
    title = list_type_title(button_type)

    button_class = ["sparkley button button--clickbait round", activeclass, color].join(" ")
    content_tag :span,
                title,
                {id: button_type,
                class: button_class,
                "data-icon" => icon, "title": title}
  end
end
