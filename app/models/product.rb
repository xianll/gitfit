class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one_attached :file
  has_many :order
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :content, presence: true
  validate :image_type
  # validate :file_type

  private
  def image_type
    if image.attached? == false
      errors.add(:image, "is missing!")
    end
    if !image.content_type.in?(%w(image/jpeg image/jpg image/png))
      errors.add(:image, 'Must be a JPEG, JPG or PNG file')
    end
  end

  # def file_type
  #   if file.attached? == false
  #     errors.add(:file, "is missing!")
  #   end
  #   if file.attached? && !file.content_type.in?(%w(application/pdf))
  #     file.purge
  #     errors.add(:file, 'Must be a PDF file')
      
  #   end
  # end

end
