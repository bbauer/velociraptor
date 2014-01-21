module ApplicationHelper
  def icon(icon_class, text)
    "<i class='fa #{icon_class}'></i> #{text}".html_safe
  end
end
