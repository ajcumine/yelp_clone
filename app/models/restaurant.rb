class Restaurant < ActiveRecord::Base
  has_many :reviews

  validates :name, presence: true
  validates :location, presence: true

  def average_score
    return 'No reviews' if reviews.none?
    reviews.average(:rating)
  end

end
