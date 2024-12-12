class Forum < ApplicationRecord
  belongs_to :musician
  has_many :posts
  validates :image, presence: true, allow_blank: true
  validates :title, presence: true
  has_many :posts
  has_one_attached :image


  before_destroy :ensure_no_posts

  private

  def ensure_no_posts
    if posts.any?
      errors.add(:base, "Cannot delete a forum with associated posts.")
      throw(:abort)
    end
  end
end
