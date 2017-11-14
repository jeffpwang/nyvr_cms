class RemoveRefineryVideos < ActiveRecord::Migration
  def change
  	drop_table :refinery_videos
  end
end
