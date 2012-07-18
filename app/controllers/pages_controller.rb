class PagesController < ApplicationController
  def home
    @user=current_user
    @make_announcement = Announcement.new
    @announcements = Announcement.all
    if signed_in?
      @myCompany = Company.find(@user.company_id)    
    else
      redirect_to signin_path    
    end
      @companies = Company.all 
      @companies.delete @myCompany 
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
  

end
