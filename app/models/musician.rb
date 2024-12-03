class Musician < ApplicationRecord
  has_many :instruments
  has_many :compositions
end
