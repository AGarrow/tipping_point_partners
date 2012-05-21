class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def work
    @title = "Work"
  end

  def people
    @title = "People"
  end

  def workspace
    @title = "Workspace"
  end

  def faqs
    @title = "FAQs"
  end

  def contact
    @title = "Contact Us"
  end
end
