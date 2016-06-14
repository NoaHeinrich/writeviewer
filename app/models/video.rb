class Video < ActiveRecord::Base
  include PgSearch
  belongs_to :uploader, class_name: "User", foreign_key: "uploader_id"
  has_one :description

  validates :url, presence: true
  validates :embed_code, presence: true
  validates :title, presence: true
  validates :thumbnail, presence: true

  pg_search_scope :search_by_title, :against => :title

  def get_video_info
    video_info = VideoInfo.new(self.url)
    unless video_info.available?
      raise RuntimeError, "The url you entered was not valid. Please ry again"
    else
      self.embed_code = video_info.embed_code
      self.title = video_info.title
      self.thumbnail = video_info.thumbnail_medium
    end
  end
end