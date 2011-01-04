class App < ActiveRecord::Base
  @@per_page = 10
  
  def has_youtube?
    !self.youtube_url.blank?
  end
  
end
