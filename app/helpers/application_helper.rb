module ApplicationHelper
  def format_text (text)
    auto_link(simple_format(text), mode=:all)
  end
end
