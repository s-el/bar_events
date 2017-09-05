class Bar < ApplicationRecord
  belongs_to :user
  has_many :events

  # validates :location, presence: true
  # validates :name, presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  searchkick
end
