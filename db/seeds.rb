# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

if true or Rails.env == "development"
  i = 0
  55.times do
    App.create(
      :title    => "(#{i.to_s})" + Faker::Lorem.sentences(1).to_s,
      :desc     => Faker::Lorem.paragraphs(2).join("<br />"),
      :app_type => "iphone",
      :icon_url => "/images/sample_icon.png",
      :youtube_url => ( (rand(9) % 2 == 0) ? "" : "http://www.youtube.com/" )
    )
    i += 1
  end
  75.times do
    App.create(
      :title    => "(#{i.to_s})" + Faker::Lorem.sentences(1).to_s,
      :desc     => Faker::Lorem.paragraphs(2).join("<br />"),
      :app_type => "ipad",
      :icon_url => "/images/sample_icon.png",
      :youtube_url => ( (rand(9) % 2 == 0) ? "" : "http://www.youtube.com/" )
    )
    i += 1
  end
end