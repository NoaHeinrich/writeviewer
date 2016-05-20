class Description < ActiveRecord::Base
  belongs_to :writer, class_name: "User", foreign_key: "writer_id"
  belongs_to :video

  validates :content, presence: true
end