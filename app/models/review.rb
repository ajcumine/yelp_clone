class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates :rating, inclusion: { in: [1,2,3,4,5]}
  validates :comment, presence: true
end
