class Meal < ActiveRecord::Base
  belongs_to :user
  belongs_to :symptom
  has_many :ingredients
  has_many :reactions
  has_many :symptoms, through: :reactions

  #  for uploading a picture via paperclip
  has_attached_file :meal_pic
  # validates that uploaded file is a picture
  validates_attachment_content_type :meal_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
