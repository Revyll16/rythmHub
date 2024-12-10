class Forum < ApplicationRecord
  belongs_to :musician
  has_many :posts, dependent: :destroy
  validates :image_url, presence: true, allow_blank: true
  validates :title, presence: true
  has_many :posts

  before_destroy :ensure_no_posts

  private

  def ensure_no_posts
    if posts.any?
      errors.add(:base, "Cannot delete a forum with associated posts.")
      throw(:abort)
    end
  end
end
