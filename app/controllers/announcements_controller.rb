class AnnouncementsController < ApplicationController
  load_and_authorize_resource
  def index
    
  @announcements = Announcement.paginate(:page => params[:page])
  @make_announcement = Announcement.new

    respond_to do |format|
      format.html
      format.json {render :json => @announcements.to_json(
        :include => {
          :company => {
            :only => :name
          }
          })}
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
