class PagesController < ApplicationController
require 'will_paginate/array'
  def home
    @user=current_user
    if signed_in?
      @myCompany = Company.find(@user.company_id)    
    else
      redirect_to signin_path    
    end

    @companies = Company.all.sort_by(&:name) 
    @companies.delete @myCompany 
    @announcement = Announcement.new(params[:announcement])
    @announcements = Announcement.where(:public => true).paginate(:page => params[:page])
  end

  def me
    @user= current_user
  end
  


  def my_company
    @user= current_user
    @company = Company.find(@user.company_id)
  end

  def workspace
  end

  def faqs
  end
  
  def kyocera_mac
  end
  
  def kyocera_windows
  end
  

end
