class CreateVersionControl < ActiveRecord::Migration
  def change
    create_table :version_controls do |t|
      t.float :version
    end
  end
end
