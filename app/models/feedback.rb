class Feedback < ApplicationRecord
  belongs_to :musician
  belongs_to :composition
end
