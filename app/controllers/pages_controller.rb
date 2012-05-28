class PagesController < ApplicationController
  def home
  end

  def me
    @user= current_user
  end

  def my_company
  end

  def workspace
  end

  def faqs
  end
end
