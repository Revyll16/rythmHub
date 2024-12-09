class Musician < ApplicationRecord
  belongs_to :user
  has_many :compositions, dependent: :destroy
  has_and_belongs_to_many :instruments

  validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true
  validates :address, presence: true

  def img_url
    image_url
  end
end
