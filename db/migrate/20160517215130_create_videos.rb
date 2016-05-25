class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :embed_code
      t.string :title
      t.string :thumbnail
      t.integer :uploader_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
