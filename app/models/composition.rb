class Composition < ApplicationRecord
  has_one_attached :file
  has_many :feedbacks
  belongs_to :musician

  validates :title, presence: true
  validates :description, presence: true
  validate :correct_file_type

  private

  def correct_file_type
    if file.attached?
      acceptable_types = ['image/png', 'image/jpg', 'image/jpeg', 'video/mp4', 'audio/mpeg', 'audio/mp3']
      unless acceptable_types.include?(file.content_type)
        errors.add(:file, "must be a PNG, JPG, JPEG, MP4, MP3, or MPEG")
      end
    else
      errors.add(:file, "must be attached")
    end
  end
end
