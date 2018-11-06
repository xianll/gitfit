class Review < ApplicationRecord
  belongs_to :order
  validates :rating, :inclusion => 1..5, on => :create

end
