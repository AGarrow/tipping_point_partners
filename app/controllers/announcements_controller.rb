class AnnouncementsController < ApplicationController
  load_and_authorize_resource
  def index
    @announcements = Announcement.all
    render :json => @announcements
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
