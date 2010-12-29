class CreateApps < ActiveRecord::Migration
  def self.up
    create_table :apps do |t|
      t.string :title
      t.text :desc
      t.string :icon

      t.timestamps
    end
  end

  def self.down
    drop_table :apps
  end
end
