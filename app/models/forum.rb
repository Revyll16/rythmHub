class Forum < ApplicationRecord
  belongs_to :musician
  has_many :posts
  has_many :messages, dependent: :destroy
  validates :image_url, presence: true, allow_blank: true
end
