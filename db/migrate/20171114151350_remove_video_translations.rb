class RemoveVideoTranslations < ActiveRecord::Migration
  def change
  	drop_table :refinery_video_translations
  end
end
