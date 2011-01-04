require "tool_box"
class Admin::MainController < ApplicationController
  
  layout "admin"
  
  def login
    respond_to do |format|
      format.html
    end
  end
  
  def check_login
    succ, msg = ToolBox.check_login(params[:account], params[:password])
    respond_to do |format|
      if succ
        session[:admin_login] = "iamhere"
        format.html {redirect_to admin_apps_path}
      else
        flash[:error] = msg
        format.html {redirect_to login_path}
      end
    end
  end
  
  def logout
    session[:admin_login] = nil
    redirect_to root_path
  end
  
  def index
    
  end
  
end