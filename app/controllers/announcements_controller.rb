class AnnouncementsController < ApplicationController
  load_and_authorize_resource
  def index
    
    @announcements = Announcement.all
    respond_to do |format|
      format.html {redirect_to home_path}
      format.json {render json: @announcements}
    end
  end
  
  def create
    @announcement = current_user.company.announcements.build(params[:announcement])
    if @announcement.save
      flash[:success] = "announcement made!"
    end
    redirect_to home_path
  end

  def destroy
    if @announcement.destroy
      redirect_to home_path
    end
  end
end
