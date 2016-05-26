class Video < ActiveRecord::Base
  include PgSearch
  belongs_to :uploader, class_name: "User", foreign_key: "uploader_id"
  has_one :description

  validates :url, presence: true
  validates :embed_code, presence: true
  validates :title, presence: true
  validates :thumbnail, presence: true

  pg_search_scope :search_by_title, :against => :title
end