class App < ActiveRecord::Base
  
  def has_youtube?
    !self.youtube_url.blank?
  end
  
end
