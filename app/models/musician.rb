class Musician < ApplicationRecord
  has_many :instruments
  has_many :compositions
  validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true
  validates :address, presence: true
  def img_url
    image_url
  end
end
