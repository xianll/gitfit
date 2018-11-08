require 'open-uri'
class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  before_save :grab_image

  def grab_image
    
    source = open("http://www.instagram.com/#{instagram_username}/"){|f|f.read}
    urls = URI.extract(source)
    url_pics =urls.select! { |item| item.include?('.jpg') }
    url = url_pics.first
    instagram_url = open("#{url}")
    self.avatar.attach(io: instagram_url  , filename: "#{instagram_username}_avatar.jpg")
  end
end
