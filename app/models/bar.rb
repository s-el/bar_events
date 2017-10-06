class Bar < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_attachment :photo

  # validates :location, presence: true
  # validates :name, presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  searchkick

  def bar_rating
    total_rating = []
    sum = 0
    unless self.reviews.length == 0
      self.reviews.each do |review|
        total_rating << review.rating
      end
      total_rating.each do |rate|
        sum += rate
      end
      sum = (sum / total_rating.length).round
    else
      sum = 0
    end
      return sum
  end

end
