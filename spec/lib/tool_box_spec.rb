require 'spec_helper'
require 'tool_box'

describe ToolBox do
  describe "check_login" do
    it "login false with both wrong" do
      succ, msg = ToolBox.check_login("kaka", "kaka")
      succ.should == false
      msg.should == "Login fail. Please try again."
    end
    
    it "with correct account" do
      succ, msg = ToolBox.check_login("liwei", "kaka")
      succ.should == false
      msg.should == "Login fail. Please try again."
    end
    
    it "with correct password" do
      succ, msg = ToolBox.check_login("kaka", "liwei")
      succ.should == false
      msg.should == "Login fail. Please try again."
    end
    
    it "with correct account and psw" do
      succ, msg = ToolBox.check_login("liwei", "liwei")
      succ.should == true
      msg.should be_blank
    end
  end
  
end