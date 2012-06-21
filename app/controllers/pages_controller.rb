class PagesController < ApplicationController
  def home
    @user=current_user
    if !signed_in?
      redirect_to signin_path    
    else
    @myCompany = Company.find(@user.company_id) 
    @companies = Company.all 
    @companies.delete @myCompany
    end 
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
