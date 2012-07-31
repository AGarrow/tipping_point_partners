module AnnouncementsHelper
  require 'rails_rinku'
  def format_text (text)
    auto_link(text, mode=:all)
  end
end
