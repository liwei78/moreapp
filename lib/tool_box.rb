require 'digest'

class ToolBox
  
  def self.check_login(account, password)
    succ = false
    msg  = ""
    if account == SITE_SETTINGS["admin_account"] and password == SITE_SETTINGS["admin_password"]
      succ = true
    else
      msg = "Login fail. Please try again."
    end
    return succ, msg
  end
  
  private
  
  def hash(str)
    Digest::SHA2.hexdigest(str)
  end
  
end