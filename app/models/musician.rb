class Musician < ApplicationRecord
  has_many :compositions, dependent: :destroy
  has_many :instruments
end
