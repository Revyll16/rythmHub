class Musician < ApplicationRecord
  has_many :compositions, dependent: :destroy
end
