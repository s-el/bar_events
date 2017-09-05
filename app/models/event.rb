class Event < ApplicationRecord
  belongs_to :bar

  has_many :attendances
  has_many :reviews

  searchkick locations: [:location]

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def search_data
    attributes.merge(location: { lat: bar.latitude, lon: bar.longitude })
  end

  # validates :category, presence: true
  # validates :date, presence: true
  # validates :title, presence: true
end
