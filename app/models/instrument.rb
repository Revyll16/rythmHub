class Instrument < ApplicationRecord
  has_and_belongs_to_many :musicians
  belongs_to :musician

  include PgSearch::Model
  multisearchable against: [:name, :description]

end
