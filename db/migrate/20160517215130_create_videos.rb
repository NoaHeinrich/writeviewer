class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.integer :uploader_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
