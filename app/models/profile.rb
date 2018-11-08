require 'open-uri'
class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  before_save :grab_image
  # before_save :grab_followers
  validates :biography, presence: true
  validates :instagram_username, presence: true 
  validates :gender, presence: true
  has_one_attached :image
  validate :image_type

  def grab_image
    source = open("http://www.instagram.com/#{instagram_username}/"){|f|f.read}
    urls = URI.extract(source)
    url_pics =urls.select! { |item| item.include?('.jpg') }
    url = url_pics.first
    instagram_url = open("#{url}")
    self.avatar.attach(io: instagram_url  , filename: "#{instagram_username}_avatar.jpg")
  end

  # def grab_followers
  #   source = open("http://www.instagram.com/#{instagram_username}/"){|f|f.read}
  #   urls = URI.extract(source)
  #   lines = source.split("\n")
  #   lines.select! { |line| line.include?(' Followers') }
  #   description_split = lines[0].split('"')
  #   current_user.followers = description_split[1].split(" ")[0]
  # end
  
  private
  def image_type
    if image.attached? == false
      errors.add(:image, "is missing!")
    end
    if !image.content_type.in?(%w(image/jpeg image/jpg image/png))
      errors.add(:image, 'Must be a JPEG, JPG or PNG file')
    end
  end

end
