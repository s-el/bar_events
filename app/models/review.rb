class Review < ApplicationRecord
  belongs_to :attendance

  # validates :content, presence: true
end
