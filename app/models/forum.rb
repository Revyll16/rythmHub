class Forum < ApplicationRecord
  belongs_to :musician
  has_many :posts
end
