class Admin::EmailsController < ApplicationController
  
  before_filter :need_login
  
  layout "admin"

  def index
    @emails = Email.paginate(:page => params[:page], :per_page => 50, :order => "id desc")
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @email = Email.find(params[:id])
  end

  def new
    @email = Email.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @email = Email.find(params[:id])
  end

  def create
    @email = Email.new(params[:email])

    respond_to do |format|
      if @email.save
        flash[:success] = 'Email was successfully created.'
        format.html { redirect_to(admin_emails_path) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @email = Email.find(params[:id])

    respond_to do |format|
      if @email.update_attributes(params[:email])
        flash[:success] = 'Email was successfully updated.'
        format.html { redirect_to(admin_emails_path) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      flash[:success] = 'A Email was deleted.'
      format.html { redirect_to(admin_emails_path) }
    end
  end
  
  private
  
  def need_login
    unless session[:admin_login] == SITE_SETTINGS["admin_key"]
      flash[:error] = "Login First !"
      redirect_to login_path 
    end
  end
  
end