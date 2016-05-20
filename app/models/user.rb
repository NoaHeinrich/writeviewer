class User < ActiveRecord::Base
  has_many :uploads, class_name: "Video", foreign_key: "uploader_id"
  has_many :descriptions, foreign_key: "writer_id"
  has_many :notifications

  validates :username, uniqueness: true,
    presence: true
  validates :email, uniqueness: true,
    presence: true,
    format: { with: /\w+@\w+\.\w{2,3}/i, message: "please enter a valid email address" }
    validates :password, presence: true
    has_secure_password
end