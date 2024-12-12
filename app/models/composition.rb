class Composition < ApplicationRecord
  belongs_to :musician
  validates :title, presence: true
  has_one_attached :file
  has_many :feedbacks

  # Extract and return the embed URL for the video
  def embed_video_url
    return nil unless video_url.present?

    # Extract the YouTube video ID
    if video_url =~ /(?:https?:\/\/)?(?:www\.)?youtube\.com\/watch\?v=([a-zA-Z0-9_-]+)/
      "https://www.youtube.com/embed/#{$1}"
    elsif video_url =~ /(?:https?:\/\/)?(?:www\.)?youtu\.be\/([a-zA-Z0-9_-]+)/
      "https://www.youtube.com/embed/#{$1}"
    else
      nil # Return nil if the URL is not a valid YouTube link
    end
  end
end
