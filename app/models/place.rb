class Place < ApplicationRecord
  geocoded_by :location   
  after_validation :geocode
  validates :location, presence: true, uniqueness: true
  has_and_belongs_to_many :users, dependent: :destroy
  has_many :likes
  has_attached_file :photo, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true, styles: { original: {convert_options: '-auto-orient'} }, default_url: 'https://pbs.twimg.com/media/CEu0Z99UIAA6xAJ.jpg'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

end
