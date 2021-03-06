class UsersController < ApplicationController
  
  load_and_authorize_resource :except => :validate
  def index
    @users = User.all
    @first_last = User.all.sort_by(&:first_name)
    @last_first = User.all.sort_by(&:last_name)
    @company_name = User.all.sort_by{|user| [user.company.name, user.last_name]}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @first_last.to_json(
        :include => {
          :company => {
            :only => :name
          }
          })}
       
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @user.updating_password = false
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    
    if @user.save && @user.admin_added?
      redirect_to companies_path
    elsif @user.save 
      sign_in(@user)    
      respond_to do |format|
        format.html { redirect_to @user }    
        format.json { render json: @user, status: :created, location: @user }
      end     
    else      
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end    
    end
  end
  
  def validate
    user=User.find_by_validation_token(params[:token])
    user.role="employee"
    user.save
    sign_in(user) 
    redirect_to home_path
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
