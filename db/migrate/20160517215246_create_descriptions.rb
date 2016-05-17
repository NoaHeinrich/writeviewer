class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.integer :writer_id
      t.integer :video_id
      t.text :content
      t.integer :rating

      t.timestamps null: false
    end
  end
end
