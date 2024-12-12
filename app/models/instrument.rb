class Instrument < ApplicationRecord
  # has_and_belongs_to_many :musicians
  # has_and_belongs_to_many :compositions
  belongs_to :musician

  include PgSearch::Model
  multisearchable against: [:name, :description]
  has_many :composition_instruments, dependent: :destroy
  has_many :compositions, through: :composition_instruments
end
