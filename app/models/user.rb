class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_attached_file :photo, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true, styles: { original: {convert_options: '-auto-orient'} }, default_url: 'https://static.pexels.com/photos/115011/cat-face-close-view-115011.jpeg'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  # validates_length_of :password, minimum: 6
end
