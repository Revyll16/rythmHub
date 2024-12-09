class Feedback < ApplicationRecord
  belongs_to :composition
  belongs_to :musician

  validates :content, presence: true, length: { minimum: 1, maximum: 500 }
end
