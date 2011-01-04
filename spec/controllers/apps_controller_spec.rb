require 'spec_helper'

describe AppsController do
  
  describe "get all right" do
    it "ge index" do
      get :index
      response.should be_success
    end

    it "get ipad" do
      get :ipad
      response.should be_success
    end

    it "get view" do
      @app = App.create
      get app_path(@app.id)
      response.should be_success
      @app.destroy
    end

  end
  
  

end
