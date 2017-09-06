class Review < ApplicationRecord
  belongs_to :bar

  # validates :content, presence: true
end
