class CreateApps < ActiveRecord::Migration
  def self.up
    create_table :apps do |t|
      t.string :title
      t.text   :desc
      t.string :app_type
      t.string :category
      t.string :icon_url
      t.string :youtube_url
      t.integer :position, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :apps
  end
end
