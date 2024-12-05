class Composition < ApplicationRecord
  belongs_to :musician
  validates :title, presence: true
  has_one_attached :file
end
