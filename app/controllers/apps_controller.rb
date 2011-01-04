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
    respond_to do |format|
      format.js
    end
  end
  
end
