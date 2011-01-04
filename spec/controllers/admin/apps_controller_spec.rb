require 'spec_helper'

describe Admin::AppsController do
  
  before(:each) do
    session[:admin_login] = SITE_SETTINGS["admin_key"]
  end

  it "ge index" do
    get :index
    response.should be_success
  end
  
  

end
