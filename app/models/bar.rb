class Bar < ApplicationRecord
  belongs_to :user
  has_many :events

  # validates :location, presence: true
  # validates :name, presence: true
end
