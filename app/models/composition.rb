class Composition < ApplicationRecord
  belongs_to :musician

  validates :title, presence: true
  validates :video_url, presence: true
end
