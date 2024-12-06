class Composition < ApplicationRecord
  belongs_to :musician

  validates :title, presence: true

end
