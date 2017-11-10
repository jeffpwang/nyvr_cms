# This migration comes from refinery_contents (originally 1)
class CreateContentsContents < ActiveRecord::Migration

  def up
    create_table :refinery_contents do |t|
      t.string :title
      t.integer :thumbnail_id
      t.integer :file_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-contents"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/contents/contents"})
    end

    drop_table :refinery_contents

  end

end
