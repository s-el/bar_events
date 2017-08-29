class Event < ApplicationRecord
  belongs_to :bar

  has_many :attendances
  has_many :reviews

  # validates :category, presence: true
  # validates :date, presence: true
  # validates :title, presence: true
end
