class App < ActiveRecord::Base
  
  validates :title,
    :presence => true
  validates :desc,
    :presence => true
  
  def has_youtube?
    !self.youtube_url.blank?
  end
  
end
