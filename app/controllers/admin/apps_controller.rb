class Admin::AppsController < ApplicationController
  
  before_filter :need_login
  
  layout "admin"

  def index
    @apps = App.paginate(
      :conditions => ["app_type = ?", (params[:app_type].nil? ? "iphone" : params[:app_type])], 
      :page => params[:page], 
      :per_page => 20, 
      :order => "position desc, id desc")
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @app = App.find(params[:id])
  end

  def new
    @app = App.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @app = App.find(params[:id])
  end

  def create
    @app = App.new(params[:app])

    respond_to do |format|
      if @app.save
        flash[:success] = 'App was successfully created.'
        format.html { redirect_to(admin_app_path(@app)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @app = App.find(params[:id])

    respond_to do |format|
      if @app.update_attributes(params[:app])
        flash[:success] = 'App was successfully updated.'
        format.html { redirect_to(admin_app_path(@app)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @app = App.find(params[:id])
    @app.destroy
    respond_to do |format|
      flash[:success] = 'A App was deleted.'
      format.html { redirect_to(admin_apps_path) }
    end
  end
  
  private
  
  def need_login
    puts params[:controller]
    puts params[:action]
    unless session[:admin_login] == SITE_SETTINGS["admin_key"]
      flash[:error] = "Login First !"
      redirect_to login_path 
    end
  end
  
end