class AppsController < ApplicationController
  
  def index
    @apps = App.find(:all, 
      :conditions => ["app_type = ?", "iphone"], 
      :order => "position desc, id desc", 
      :limit => SITE_SETTINGS["each_show"])
    @on_iphone = "on-iphone"
    @app_type = "iphone"
    respond_to do |format|
      format.html
    end
  end

  def ipad
    @apps = App.find(:all, 
      :conditions => ["app_type = ?", "ipad"], 
      :order => "position desc, id desc", 
      :limit => SITE_SETTINGS["each_show"])
    @on_ipad = "on-ipad"
    @app_type = "ipad"
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
    @apps = App.find(:all, 
      :conditions => ["app_type = ?", params[:app_type]], 
      :offset => params[:offset], 
      :limit => SITE_SETTINGS["each_show"], 
      :order => "position desc, id desc")
    @div_id = @apps.blank? ? 0 : @apps[0].id
    @offset = params[:offset].to_i + SITE_SETTINGS["each_show"]
    @app_type = params[:app_type]
    respond_to do |format|
      format.js
    end
  end
  
  def subscribe
    @email = Email.new(:address => params[:subscribe_mail])
    respond_to do |format|
      format.js
    end
  end
  
end
