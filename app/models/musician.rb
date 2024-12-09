class Musician < ApplicationRecord
  belongs_to :user
  has_many :compositions, dependent: :destroy

  has_many :instruments
  has_many :feedbacks


  validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true
  validates :address, presence: true

  def img_url
    image_url
  end

  include PgSearch::Model
  multisearchable against: [:name, :bio]

  pg_search_scope :global_search,
  against: [ :name, :bio ],
  associated_against: {
    user: [ :email ]
  },
  using: {
    tsearch: { prefix: true }
  }

end
