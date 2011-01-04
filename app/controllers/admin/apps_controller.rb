class Admin::AppsController < ApplicationController
  
  before_filter :need_login
  
  layout "admin"

  def index
    respond_to do |format|
      format.html
    end
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
        format.html { redirect_to(@app, :notice => 'App was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @app = App.find(params[:id])

    respond_to do |format|
      if @app.update_attributes(params[:app])
        format.html { redirect_to(@app, :notice => 'App was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @app = App.find(params[:id])
    @app.destroy

    respond_to do |format|
      format.html { redirect_to(apps_url) }
    end
  end
  
  private
  
  def need_login
    unless session[:admin_login] == SITE_SETTINGS["admin_key"]
      flash[:error] = "Login first!"
      redirect_to login_path 
    end
  end
  
end