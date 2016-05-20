class Video < ActiveRecord::Base
  belongs_to :uploader, class_name: "User", foreign_key: "uploader_id"
  has_one :description

  validates :url, presence: true
end