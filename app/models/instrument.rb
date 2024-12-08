class Instrument < ApplicationRecord
  belongs_to :musician

  include PgSearch::Model
  multisearchable against: [:name, :description]

end
