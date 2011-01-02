class AppsController < ApplicationController

  def index
    @apps = App.find(:all, :conditions => ["app_type = ?", "iphone"], :order => "id desc", :limit => 6)
    @on_iphone = "on-iphone"

    respond_to do |format|
      format.html
    end
  end

  def ipad
    @apps = App.find(:all, :conditions => ["app_type = ?", "ipad"], :order => "id desc", :limit => 6)
    @on_ipad = "on-ipad"
    respond_to do |format|
      format.html {render "apps/index"}
    end
  end

  def show
    @app = App.find(params[:id])
    @on_iphone = "on-iphone" if @app.app_type == "iphone"
    @on_ipad   = "on-ipad"   if @app.app_type == "ipad"
    respond_to do |format|
      format.html
    end
  end
  
  def more
    
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
end
