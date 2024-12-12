class Composition < ApplicationRecord
  belongs_to :musician
  validates :title, presence: true
  has_one_attached :file
  has_many :feedbacks
  has_many :composition_instruments, dependent: :destroy
  has_many :instruments, through: :composition_instruments
end
